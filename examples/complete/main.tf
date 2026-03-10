module "complete_volume" {
  source = "../../"

  # Required
  name        = var.name
  size        = var.size
  volume_type = var.volume_type
  instance_id = var.instance_id

  # Volume options
  description          = var.description
  metadata             = var.metadata
  availability_zone    = var.availability_zone
  region               = var.region
  consistency_group_id = var.consistency_group_id
  source_replica       = var.source_replica
  snapshot_id          = var.snapshot_id
  source_vol_id        = var.source_vol_id
  image_id             = var.image_id
  backup_id            = var.backup_id
  enable_online_resize = var.enable_online_resize
  volume_retype_policy = var.volume_retype_policy
  scheduler_hints      = var.scheduler_hints

  # Attachment options
  device         = var.device
  multiattach    = var.multiattach
  tag            = var.tag
  vendor_options = var.vendor_options
}
