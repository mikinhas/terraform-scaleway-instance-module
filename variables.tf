variable "instance_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_image" {
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
  type        = string
  description = "Enable default security"
  default     = "true"
}
