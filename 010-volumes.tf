resource "openstack_blockstorage_volume_v3" "volume" {
  count                = var.create_volume && !var.ignore_metadata_changes ? 1 : 0
  name                 = var.name
  size                 = var.size
  volume_type          = var.volume_type
  enable_online_resize = var.enable_online_resize
  region               = var.region == null ? null : var.region
  availability_zone    = var.availability_zone
  description          = var.description
  metadata             = var.metadata
  consistency_group_id = var.consistency_group_id
  source_replica       = var.source_replica
  snapshot_id          = var.snapshot_id
  source_vol_id        = var.source_vol_id
  image_id             = var.image_id
  backup_id            = var.backup_id
  # backup_id requires Cinder Block Storage microversion 3.47+.
  volume_retype_policy = var.volume_retype_policy == null ? null : lower(var.volume_retype_policy)

  dynamic "scheduler_hints" {
    for_each = var.scheduler_hints
    content {
      different_host        = try(scheduler_hints.value.different_host, null)
      same_host             = try(scheduler_hints.value.same_host, null)
      local_to_instance     = try(scheduler_hints.value.local_to_instance, null)
      query                 = try(scheduler_hints.value.query, null)
      additional_properties = try(scheduler_hints.value.additional_properties, null)
    }
  }

  timeouts {
    create = var.volume_create_timeout
    delete = var.volume_delete_timeout
  }

  lifecycle {
    precondition {
      condition     = var.size > 0
      error_message = "size must be greater than 0."
    }

    precondition {
      condition = length(compact([
        var.snapshot_id,
        var.source_vol_id,
        var.image_id,
        var.backup_id,
      ])) <= 1
      error_message = "Only one of snapshot_id, source_vol_id, image_id, backup_id can be set."
    }

    precondition {
      condition     = !var.multiattach || try(trimspace(var.volume_type) != "", false)
      error_message = "When multiattach is enabled, volume_type must be explicitly set to a multiattach-capable Cinder volume type."
    }
  }
}

resource "openstack_blockstorage_volume_v3" "volume_ignore_metadata" {
  count                = var.create_volume && var.ignore_metadata_changes ? 1 : 0
  name                 = var.name
  size                 = var.size
  volume_type          = var.volume_type
  enable_online_resize = var.enable_online_resize
  region               = var.region == null ? null : var.region
  availability_zone    = var.availability_zone
  description          = var.description
  metadata             = var.metadata
  consistency_group_id = var.consistency_group_id
  source_replica       = var.source_replica
  snapshot_id          = var.snapshot_id
  source_vol_id        = var.source_vol_id
  image_id             = var.image_id
  backup_id            = var.backup_id
  # backup_id requires Cinder Block Storage microversion 3.47+.
  volume_retype_policy = var.volume_retype_policy == null ? null : lower(var.volume_retype_policy)

  dynamic "scheduler_hints" {
    for_each = var.scheduler_hints
    content {
      different_host        = try(scheduler_hints.value.different_host, null)
      same_host             = try(scheduler_hints.value.same_host, null)
      local_to_instance     = try(scheduler_hints.value.local_to_instance, null)
      query                 = try(scheduler_hints.value.query, null)
      additional_properties = try(scheduler_hints.value.additional_properties, null)
    }
  }

  timeouts {
    create = var.volume_create_timeout
    delete = var.volume_delete_timeout
  }

  lifecycle {
    ignore_changes = [metadata]

    precondition {
      condition     = var.size > 0
      error_message = "size must be greater than 0."
    }

    precondition {
      condition = length(compact([
        var.snapshot_id,
        var.source_vol_id,
        var.image_id,
        var.backup_id,
      ])) <= 1
      error_message = "Only one of snapshot_id, source_vol_id, image_id, backup_id can be set."
    }

    precondition {
      condition     = !var.multiattach || try(trimspace(var.volume_type) != "", false)
      error_message = "When multiattach is enabled, volume_type must be explicitly set to a multiattach-capable Cinder volume type."
    }
  }
}

locals {
  created_volume = length(concat(
    openstack_blockstorage_volume_v3.volume[*],
    openstack_blockstorage_volume_v3.volume_ignore_metadata[*]
    )) > 0 ? one(concat(
    openstack_blockstorage_volume_v3.volume[*],
    openstack_blockstorage_volume_v3.volume_ignore_metadata[*]
  )) : null

  volume_id_for_attach = var.create_volume ? local.created_volume.id : var.existing_volume_id
}

resource "openstack_compute_volume_attach_v2" "va" {
  count       = var.attachment_enabled && !var.ignore_attachment_device_changes ? 1 : 0
  instance_id = var.instance_id
  volume_id   = local.volume_id_for_attach
  device      = var.device
  multiattach = var.multiattach
  tag         = var.tag
  # tag requires Nova microversion 2.49+.
  region = var.region

  vendor_options {
    ignore_volume_confirmation = var.vendor_options.ignore_volume_confirmation
  }

  timeouts {
    create = var.attachment_create_timeout
    delete = var.attachment_delete_timeout
  }
}

resource "openstack_compute_volume_attach_v2" "va_ignore_device" {
  count       = var.attachment_enabled && var.ignore_attachment_device_changes ? 1 : 0
  instance_id = var.instance_id
  volume_id   = local.volume_id_for_attach
  device      = var.device
  multiattach = var.multiattach
  tag         = var.tag
  # tag requires Nova microversion 2.49+.
  region = var.region

  vendor_options {
    ignore_volume_confirmation = var.vendor_options.ignore_volume_confirmation
  }

  timeouts {
    create = var.attachment_create_timeout
    delete = var.attachment_delete_timeout
  }

  lifecycle {
    ignore_changes = [device]
  }
}
