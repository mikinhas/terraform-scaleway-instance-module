data "scaleway_vpc_private_network" "private_network" {
  name = var.private_network_name
}

data "scaleway_marketplace_image" "image" {
  label         = var.instance_image_name
  instance_type = var.instance_type
}

resource "scaleway_instance_server" "instance" {
  name              = var.instance_name
  type              = var.instance_type
  image             = data.scaleway_marketplace_image.image.id
  ip_id             = scaleway_instance_ip.ip.id
  enable_dynamic_ip = false
  security_group_id = scaleway_instance_security_group.security_group.id

  additional_volume_ids = var.enable_additional_volume ? [scaleway_instance_volume.additional_volume[0].id] : null

  private_network {
    pn_id = data.scaleway_vpc_private_network.private_network.id
  }

}

resource "scaleway_instance_ip" "ip" {}


resource "scaleway_instance_volume" "additional_volume" {
  count = var.enable_additional_volume == true ? 1 : 0

  type       = var.additional_volume_type
  name       = var.additional_volume_name
  size_in_gb = var.additional_volume_size
}

resource "scaleway_instance_security_group" "security_group" {
  name                    = var.security_group_name
  inbound_default_policy  = var.inbound_default_policy
  outbound_default_policy = var.outbound_default_policy

  external_rules = var.external_rules

  enable_default_security = var.enable_default_security
}

resource "scaleway_instance_security_group_rules" "rules" {
  security_group_id = scaleway_instance_security_group.security_group.id

  dynamic "inbound_rule" {
    for_each = var.security_group_rules
    content {
      action   = inbound_rule.value.action
      ip_range = inbound_rule.value.ip_range
      port     = inbound_rule.value.port
      protocol = inbound_rule.value.protocol
    }
  }
}
