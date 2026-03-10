resource "openstack_blockstorage_volume_v3" "volume" {
  name                 = var.name
  size                 = var.size
  volume_type          = var.volume_type
  enable_online_resize = var.enable_online_resize
  region               = var.region == null ? null : var.region
  availability_zone    = var.availability_zone == "" ? null : var.availability_zone
  description          = var.description
  metadata             = var.metadata
  consistency_group_id = var.consistency_group_id
  source_replica       = var.source_replica
  snapshot_id          = var.snapshot_id
  source_vol_id        = var.source_vol_id
  image_id             = var.image_id
  backup_id            = var.backup_id
  volume_retype_policy = var.volume_retype_policy

  dynamic "scheduler_hints" {
    for_each = var.scheduler_hints
    content {
      different_host        = lookup(scheduler_hints.value, "different_host", null)
      same_host             = lookup(scheduler_hints.value, "same_host", null)
      local_to_instance     = lookup(scheduler_hints.value, "local_to_instance", null)
      query                 = lookup(scheduler_hints.value, "query", null)
      additional_properties = lookup(scheduler_hints.value, "additional_properties", null)
    }
  }
}

resource "openstack_compute_volume_attach_v2" "va" {
  instance_id = var.instance_id
  volume_id   = openstack_blockstorage_volume_v3.volume.id
  device      = var.device
  multiattach = var.multiattach
  tag         = var.tag
  region      = var.region

  vendor_options {
    ignore_volume_confirmation = lookup(var.vendor_options, "ignore_volume_confirmation", false)
  }
}
