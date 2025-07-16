variable "project_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "DEV1-S"
}

variable "instance_image_name" {
  type    = string
  default = "ubuntu_jammy"
}
