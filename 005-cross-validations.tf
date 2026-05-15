check "create_volume_requires_name_and_size" {
  assert {
    condition     = !var.create_volume || (var.name != null && try(trimspace(var.name) != "", false) && var.size != null && var.size > 0)
    error_message = "When create_volume is true, both name and size (>0) must be set."
  }
}

check "existing_volume_required_when_not_creating" {
  assert {
    condition     = var.create_volume || (var.existing_volume_id != null && try(trimspace(var.existing_volume_id) != "", false))
    error_message = "existing_volume_id must be set when create_volume is false."
  }
}

check "instance_required_when_attachment_enabled" {
  assert {
    condition     = !var.attachment_enabled || (var.instance_id != null && try(trimspace(var.instance_id) != "", false))
    error_message = "instance_id must be set when attachment_enabled is true."
  }
}
