resource "openstack_blockstorage_volume_v3" "volume" {
  name                 = var.name
  size                 = var.size
  volume_type          = var.volume_type
  enable_online_resize = true
  region               = var.region == null ? null : var.region
  availability_zone    = var.availability_zone == null ? null : var.availability_zone
}

resource "openstack_compute_volume_attach_v2" "va" {
  instance_id   = var.instance_id
  volume_id     = openstack_blockstorage_volume_v3.volume.id
  device        = var.device
  multiattach   = var.multiattach
  tag           = var.tag
  region        = var.region

  vendor_options {
    ignore_volume_confirmation = lookup(var.vendor_options, "ignore_volume_confirmation", false)
  }
}
