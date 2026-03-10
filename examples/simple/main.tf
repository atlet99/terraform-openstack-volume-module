module "simple_volume" {
  source = "../../"

  name        = "simple-volume"
  size        = 10
  volume_type = "standard"
  instance_id = "your-instance-uuid"
}
