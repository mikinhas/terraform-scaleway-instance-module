variable "instance_name" {
  type        = string
  description = "Name of the instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type (e.g., DEV1-S, GP1-S)"
}

variable "instance_image_name" {
  type        = string
  description = "Image name for the instance (e.g., ubuntu_jammy)"
}

variable "security_group_name" {
  type        = string
  description = "Name of the security group"
  default     = "default_security_group"
}

variable "enable_additional_volume" {
  type        = bool
  description = "Enable additional block volume"
  default     = false
}

variable "additional_volume_type" {
  type        = string
  description = "Type of the additional volume"
  default     = "b_ssd"

  validation {
    condition     = contains(["b_ssd", "l_ssd"], var.additional_volume_type)
    error_message = "Must be 'b_ssd' or 'l_ssd'."
  }
}

variable "additional_volume_name" {
  type        = string
  description = "Name of the additional volume"
  default     = "default"
}

variable "additional_volume_size" {
  type        = number
  description = "Size of the additional volume in GB"
  default     = 10

  validation {
    condition     = var.additional_volume_size >= 1
    error_message = "Volume size must be at least 1 GB."
  }
}

variable "inbound_default_policy" {
  type        = string
  description = "Default policy for inbound traffic"
  default     = "drop"

  validation {
    condition     = contains(["accept", "drop"], var.inbound_default_policy)
    error_message = "Must be 'accept' or 'drop'."
  }
}

variable "outbound_default_policy" {
  type        = string
  description = "Default policy for outbound traffic"
  default     = "accept"

  validation {
    condition     = contains(["accept", "drop"], var.outbound_default_policy)
    error_message = "Must be 'accept' or 'drop'."
  }
}

variable "security_group_rules" {
  type = list(object({
    action   = string
    ip_range = string
    port     = number
    protocol = string
  }))
  description = "List of inbound security group rules"
  default     = []
}

variable "enable_default_security" {
  type        = bool
  description = "Enable default security"
  default     = true
}

variable "external_rules" {
  type        = bool
  description = "Enable external rules"
  default     = true
}

variable "private_network_id" {
  type        = string
  description = "ID of the private network to attach"
  default     = ""
}

variable "create_public_ipv4" {
  type        = bool
  description = "If true, create public IPv4 address"
  default     = true
}

variable "create_public_ipv6" {
  type        = bool
  description = "If true, create public IPv6 address"
  default     = true
}

