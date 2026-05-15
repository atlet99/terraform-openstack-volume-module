variable "name" {
  description = "Name of the volume"
  type        = string
  default     = null

  validation {
    condition     = var.name == null || try(trimspace(var.name) != "", false)
    error_message = "name must not be empty when set."
  }
}

variable "size" {
  description = "Size of the volume in GB"
  type        = number
  default     = null

  validation {
    condition     = var.size == null || var.size > 0
    error_message = "size must be greater than 0 when set."
  }
}

variable "volume_type" {
  description = "Type of the volume"
  type        = string
  default     = null

  validation {
    condition     = var.volume_type == null || try(trimspace(var.volume_type) != "", false)
    error_message = "volume_type must not be empty when set."
  }
}

variable "instance_id" {
  description = "ID of the instance to attach the volume to"
  type        = string
  default     = null

  validation {
    condition     = var.instance_id == null || try(trimspace(var.instance_id) != "", false)
    error_message = "instance_id must not be empty when set."
  }
}

variable "create_volume" {
  description = "Whether to create a new volume. If false, existing_volume_id must be set."
  type        = bool
  default     = true
}

variable "existing_volume_id" {
  description = "Existing volume ID to attach when create_volume is false"
  type        = string
  default     = null

  validation {
    condition     = var.existing_volume_id == null || try(trimspace(var.existing_volume_id) != "", false)
    error_message = "existing_volume_id must not be empty when set."
  }
}

variable "device" {
  description = "Device path for attachment (e.g., /dev/vdc)"
  type        = string
  default     = null

  validation {
    condition     = var.device == null || try(startswith(var.device, "/dev/"), false)
    error_message = "device must start with /dev/ when set."
  }
}

variable "multiattach" {
  description = "Flag to enable multiattach"
  type        = bool
  default     = false
}

variable "tag" {
  description = "Tag for the attached device"
  type        = string
  default     = null

  validation {
    condition     = var.tag == null || try(trimspace(var.tag) != "", false)
    error_message = "tag must not be empty when set."
  }
}

variable "region" {
  description = "Region for the Compute client"
  type        = string
  default     = null

  validation {
    condition     = var.region == null || try(trimspace(var.region) != "", false)
    error_message = "region must not be empty when set."
  }
}

variable "availability_zone" {
  description = "AZ where volume's available."
  type        = string
  default     = null

  validation {
    condition     = var.availability_zone == null || try(trimspace(var.availability_zone) != "", false)
    error_message = "availability_zone must not be empty when set."
  }
}

variable "vendor_options" {
  description = "Vendor-specific options for the attachment, e.g., ignore_volume_confirmation"
  type = object({
    ignore_volume_confirmation = optional(bool, false)
  })
  default = {
    ignore_volume_confirmation = false
  }
}

variable "description" {
  description = "A description of the volume"
  type        = string
  default     = null
}

variable "metadata" {
  description = "Metadata key/value pairs to associate with the volume"
  type        = map(string)
  default     = {}

  validation {
    condition     = alltrue([for k in keys(var.metadata) : trimspace(k) != ""])
    error_message = "metadata keys must not be empty."
  }
}

variable "ignore_metadata_changes" {
  description = "Ignore external drift for volume metadata during plan/apply"
  type        = bool
  default     = true
}

variable "ignore_attachment_device_changes" {
  description = "Ignore drift for attached device path (some hypervisors may report different device names)"
  type        = bool
  default     = false
}

variable "consistency_group_id" {
  description = "The consistency group to place the volume in"
  type        = string
  default     = null
}

variable "source_replica" {
  description = "The volume ID to replicate with"
  type        = string
  default     = null
}

variable "snapshot_id" {
  description = "The snapshot ID from which to create the volume"
  type        = string
  default     = null
}

variable "source_vol_id" {
  description = "The volume ID from which to create the volume"
  type        = string
  default     = null
}

variable "image_id" {
  description = "The image ID from which to create the volume"
  type        = string
  default     = null
}

variable "backup_id" {
  description = "The backup ID from which to create the volume"
  type        = string
  default     = null
}

variable "enable_online_resize" {
  description = "Allows extending attached volumes"
  type        = bool
  default     = true
}

variable "scheduler_hints" {
  description = "Hints for Cinder scheduler"
  type = set(object({
    different_host        = optional(list(string))
    same_host             = optional(list(string))
    local_to_instance     = optional(string)
    query                 = optional(string)
    additional_properties = optional(map(string))
  }))
  default = []
}

variable "volume_retype_policy" {
  description = "Migration policy when changing volume_type"
  type        = string
  default     = null

  validation {
    condition     = var.volume_retype_policy == null || try(contains(["never", "on-demand"], lower(var.volume_retype_policy)), false)
    error_message = "volume_retype_policy must be one of: never, on-demand."
  }
}

variable "volume_create_timeout" {
  description = "Timeout for volume creation operation (e.g., 10m, 30m)"
  type        = string
  default     = "10m"

  validation {
    condition     = can(regex("^[0-9]+(s|m|h)$", var.volume_create_timeout))
    error_message = "volume_create_timeout must match ^[0-9]+(s|m|h)$, for example 30s, 10m, 1h."
  }
}

variable "volume_delete_timeout" {
  description = "Timeout for volume deletion operation (e.g., 10m, 30m)"
  type        = string
  default     = "10m"

  validation {
    condition     = can(regex("^[0-9]+(s|m|h)$", var.volume_delete_timeout))
    error_message = "volume_delete_timeout must match ^[0-9]+(s|m|h)$, for example 30s, 10m, 1h."
  }
}

variable "attachment_create_timeout" {
  description = "Timeout for volume attachment operation (e.g., 10m, 30m)"
  type        = string
  default     = "10m"

  validation {
    condition     = can(regex("^[0-9]+(s|m|h)$", var.attachment_create_timeout))
    error_message = "attachment_create_timeout must match ^[0-9]+(s|m|h)$, for example 30s, 10m, 1h."
  }
}

variable "attachment_delete_timeout" {
  description = "Timeout for volume detachment operation (e.g., 10m, 30m)"
  type        = string
  default     = "10m"

  validation {
    condition     = can(regex("^[0-9]+(s|m|h)$", var.attachment_delete_timeout))
    error_message = "attachment_delete_timeout must match ^[0-9]+(s|m|h)$, for example 30s, 10m, 1h."
  }
}

variable "attachment_enabled" {
  description = "Whether to attach the volume to the instance"
  type        = bool
  default     = true
}
