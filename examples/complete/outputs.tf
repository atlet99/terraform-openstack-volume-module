output "volume_id" {
  description = "ID of the created volume"
  value       = module.complete_volume.volume_id
}

output "volume_name" {
  description = "Name of the created volume"
  value       = module.complete_volume.volume_name
}

output "volume_size" {
  description = "Size of the volume in GB"
  value       = module.complete_volume.volume_size
}

output "volume_type" {
  description = "Type of the volume"
  value       = module.complete_volume.volume_type
}

output "volume_description" {
  description = "Description of the created volume"
  value       = module.complete_volume.volume_description
}

output "volume_metadata" {
  description = "Metadata key/value pairs associated with the volume"
  value       = module.complete_volume.volume_metadata
}

output "volume_availability_zone" {
  description = "Availability zone of the volume"
  value       = module.complete_volume.volume_availability_zone
}

output "volume_region" {
  description = "Region of the volume"
  value       = module.complete_volume.volume_region
}

output "volume_attachment" {
  description = "Attachment information if the volume is attached to an instance"
  value       = module.complete_volume.volume_attachment
}

output "attachment_ids" {
  description = "List of IDs of the volume attachments"
  value       = module.complete_volume.attachment_ids
}

output "attached_instance_ids" {
  description = "List of IDs of the instances to which the volumes are attached"
  value       = module.complete_volume.attached_instance_ids
}

output "attached_devices" {
  description = "List of device paths for the attached volumes"
  value       = module.complete_volume.attached_devices
}

output "multiattach_enabled_list" {
  description = "List indicating if multiattach is enabled for each volume attachment"
  value       = module.complete_volume.multiattach_enabled_list
}
