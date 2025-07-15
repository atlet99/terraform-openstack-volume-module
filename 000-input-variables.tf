variable "name" {
  description = "Name of the volume"
  type        = string
}

variable "size" {
  description = "Size of the volume in GB"
  type        = number
}

variable "volume_type" {
  description = "Type of the volume"
  type        = string
}

variable "instance_id" {
  description = "ID of the instance to attach the volume to"
  type        = string
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
  default     = null
}

variable "region" {
  description = "Region for the Compute client"
  type        = string
  default     = null
}

variable "availability_zone" {
  description = "AZ where volume's available."
  type        = string
  default     = ""
}

variable "vendor_options" {
  description = "Vendor-specific options for the attachment, e.g., ignore_volume_confirmation"
  type        = map(bool)
  default     = { ignore_volume_confirmation = false }
}
