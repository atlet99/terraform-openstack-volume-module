# Outputs for openstack_blockstorage_volume_v3
output "volume_id" {
  description = "ID of the created volume"
  value       = openstack_blockstorage_volume_v3.volume.id
}

output "volume_name" {
  description = "Name of the created volume"
  value       = openstack_blockstorage_volume_v3.volume.name
}

output "volume_size" {
  description = "Size of the volume in GB"
  value       = openstack_blockstorage_volume_v3.volume.size
}

output "volume_type" {
  description = "Type of the volume"
  value       = openstack_blockstorage_volume_v3.volume.volume_type
}

output "volume_description" {
  description = "Description of the created volume"
  value       = openstack_blockstorage_volume_v3.volume.description
}

output "volume_metadata" {
  description = "Metadata key/value pairs associated with the volume"
  value       = openstack_blockstorage_volume_v3.volume.metadata
}

output "volume_availability_zone" {
  description = "Availability zone of the volume"
  value       = openstack_blockstorage_volume_v3.volume.availability_zone
}

output "volume_region" {
  description = "Region of the volume"
  value       = openstack_blockstorage_volume_v3.volume.region
}

output "volume_attachment" {
  description = "Attachment information if the volume is attached to an instance"
  value       = openstack_blockstorage_volume_v3.volume.attachment
}

# Outputs for openstack_compute_volume_attach_v2
output "attachment_ids" {
  description = "List of IDs of the volume attachments"
  value       = openstack_compute_volume_attach_v2.va[*].id
}

output "attached_instance_ids" {
  description = "List of IDs of the instances to which the volumes are attached"
  value       = openstack_compute_volume_attach_v2.va[*].instance_id
}

output "attached_volume_ids" {
  description = "List of IDs of the attached volumes"
  value       = openstack_compute_volume_attach_v2.va[*].volume_id
}

output "attached_devices" {
  description = "List of device paths for the attached volumes (depends on the hypervisor)"
  value       = openstack_compute_volume_attach_v2.va[*].device
}

output "multiattach_enabled_list" {
  description = "List indicating if multiattach is enabled for each volume attachment"
  value       = openstack_compute_volume_attach_v2.va[*].multiattach
}
