module "complete_volume" {
  source = "../../"

  # Required
  name        = var.name
  size        = var.size
  volume_type = var.volume_type
  instance_id = var.instance_id

  # Volume options
  description                      = var.description
  metadata                         = var.metadata
  ignore_metadata_changes          = var.ignore_metadata_changes
  ignore_attachment_device_changes = var.ignore_attachment_device_changes
  availability_zone                = var.availability_zone
  region                           = var.region
  consistency_group_id             = var.consistency_group_id
  source_replica                   = var.source_replica
  snapshot_id                      = var.snapshot_id
  source_vol_id                    = var.source_vol_id
  image_id                         = var.image_id
  backup_id                        = var.backup_id
  enable_online_resize             = var.enable_online_resize
  volume_retype_policy             = var.volume_retype_policy
  scheduler_hints                  = var.scheduler_hints
  volume_create_timeout            = var.volume_create_timeout
  volume_delete_timeout            = var.volume_delete_timeout
  attachment_create_timeout        = var.attachment_create_timeout
  attachment_delete_timeout        = var.attachment_delete_timeout

  # Attachment options
  device         = var.device
  multiattach    = var.multiattach
  tag            = var.tag
  vendor_options = var.vendor_options
}
