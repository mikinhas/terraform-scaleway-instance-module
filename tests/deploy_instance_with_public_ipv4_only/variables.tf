variable "instance_type" {
  type    = string
  default = "DEV1-S"
}

variable "instance_image_name" {
  type    = string
  default = "ubuntu_jammy"
}

variable "private_network_id" {
  type        = string
  description = "Name of the private_network"
  default     = ""
}
