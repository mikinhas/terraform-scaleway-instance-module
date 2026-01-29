variable "instance_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_image_name" {
  type = string
}

variable "security_group_name" {
  type    = string
  default = "default_security_group"
}

variable "enable_additional_volume" {
  type    = bool
  default = false
}

variable "additional_volume_type" {
  type    = string
  default = "b_ssd"
}

variable "additional_volume_name" {
  type    = string
  default = "default"
}

variable "additional_volume_size" {
  type    = number
  default = 10
}

variable "inbound_default_policy" {
  type    = string
  default = "drop"
}

variable "outbound_default_policy" {
  type    = string
  default = "accept"
}

variable "security_group_rules" {
  type = list(object({
    action   = string,
    ip_range = string,
    port     = number,
    protocol = string
  }))
  default = []
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
  description = "Name of the private_network"
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

