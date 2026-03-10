variable "name" {
  description = "Name of the volume"
  type        = string
  default     = "example-complete-volume"
}

variable "size" {
  description = "Size of the volume in GB"
  type        = number
  default     = 20
}

variable "volume_type" {
  description = "Type of the volume"
  type        = string
  default     = "standard"
}

variable "instance_id" {
  description = "ID of the instance to attach the volume to"
  type        = string
  default     = "your-instance-uuid"
}

variable "description" {
  description = "A description of the volume"
  type        = string
  default     = "Example volume with all options"
}

variable "metadata" {
  description = "Metadata key/value pairs to associate with the volume"
  type        = map(string)
  default = {
    environment = "staging"
    managed_by  = "terraform"
  }
}

variable "availability_zone" {
  description = "AZ where volume is available"
  type        = string
  default     = ""
}

variable "region" {
  description = "Region for the Compute client"
  type        = string
  default     = null
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

variable "volume_retype_policy" {
  description = "Migration policy when changing volume_type"
  type        = string
  default     = null
}

variable "scheduler_hints" {
  description = "Hints for Cinder scheduler"
  type        = list(map(string))
  default     = []
}

variable "device" {
  description = "Device path for attachment (e.g., /dev/vdc)"
  type        = string
  default     = null
}

variable "multiattach" {
  description = "Flag to enable multiattach"
  type        = bool
  default     = false
}

variable "tag" {
  description = "Tag for the attached device"
  type        = string
  default     = "data-volume"
}

variable "vendor_options" {
  description = "Vendor-specific options for the attachment"
  type        = map(bool)
  default = {
    ignore_volume_confirmation = false
  }
}
