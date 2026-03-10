output "volume_id" {
  description = "ID of the created volume"
  value       = module.simple_volume.volume_id
}

output "volume_name" {
  description = "Name of the created volume"
  value       = module.simple_volume.volume_name
}

output "attachment_ids" {
  description = "List of IDs of the volume attachments"
  value       = module.simple_volume.attachment_ids
}
