# Outputs for openstack_blockstorage_volume_v3
output "volume_id" {
  description = "ID of the created volume"
  value       = local.volume.id
}

output "volume_name" {
  description = "Name of the created volume"
  value       = local.volume.name
}

output "volume_size" {
  description = "Size of the volume in GB"
  value       = local.volume.size
}

output "volume_type" {
  description = "Type of the volume"
  value       = local.volume.volume_type
}

output "volume_description" {
  description = "Description of the created volume"
  value       = local.volume.description
}

output "volume_metadata" {
  description = "Metadata key/value pairs associated with the volume"
  value       = local.volume.metadata
}

output "volume_availability_zone" {
  description = "Availability zone of the volume"
  value       = local.volume.availability_zone
}

output "volume_region" {
  description = "Region of the volume"
  value       = local.volume.region
}

output "volume_attachment" {
  description = "Attachment information if the volume is attached to an instance"
  value       = local.volume.attachment
}

# Outputs for openstack_compute_volume_attach_v2
output "attachment_ids" {
  description = "List of IDs of the volume attachments"
  value       = concat(openstack_compute_volume_attach_v2.va[*].id, openstack_compute_volume_attach_v2.va_ignore_device[*].id)
}

output "attached_instance_ids" {
  description = "List of IDs of the instances to which the volumes are attached"
  value       = concat(openstack_compute_volume_attach_v2.va[*].instance_id, openstack_compute_volume_attach_v2.va_ignore_device[*].instance_id)
}

output "attached_volume_ids" {
  description = "List of IDs of the attached volumes"
  value       = concat(openstack_compute_volume_attach_v2.va[*].volume_id, openstack_compute_volume_attach_v2.va_ignore_device[*].volume_id)
}

output "attached_devices" {
  description = "List of device paths for the attached volumes (depends on the hypervisor)"
  value       = concat(openstack_compute_volume_attach_v2.va[*].device, openstack_compute_volume_attach_v2.va_ignore_device[*].device)
}

output "multiattach_enabled_list" {
  description = "List indicating if multiattach is enabled for each volume attachment"
  value       = concat(openstack_compute_volume_attach_v2.va[*].multiattach, openstack_compute_volume_attach_v2.va_ignore_device[*].multiattach)
}

output "attachment_id" {
  description = "ID of the volume attachment"
  value       = one(concat(openstack_compute_volume_attach_v2.va[*].id, openstack_compute_volume_attach_v2.va_ignore_device[*].id))
}

output "attached_instance_id" {
  description = "ID of the instance to which the volume is attached"
  value       = one(concat(openstack_compute_volume_attach_v2.va[*].instance_id, openstack_compute_volume_attach_v2.va_ignore_device[*].instance_id))
}

output "attached_volume_id" {
  description = "ID of the attached volume"
  value       = one(concat(openstack_compute_volume_attach_v2.va[*].volume_id, openstack_compute_volume_attach_v2.va_ignore_device[*].volume_id))
}

output "attached_device" {
  description = "Device path of the attached volume (depends on the hypervisor)"
  value       = one(concat(openstack_compute_volume_attach_v2.va[*].device, openstack_compute_volume_attach_v2.va_ignore_device[*].device))
}
