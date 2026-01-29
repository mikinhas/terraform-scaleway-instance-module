locals {
  ip_ids = concat(
    var.create_public_ipv4 ? [scaleway_instance_ip.ipv4[0].id] : [],
    var.create_public_ipv6 ? [scaleway_instance_ip.ipv6[0].id] : []
  )
}
resource "scaleway_instance_server" "instance" {
  name  = var.instance_name
  type  = var.instance_type
  image = var.instance_image_name
  tags  = var.tags

  ip_ids            = length(local.ip_ids) > 0 ? local.ip_ids : null
  enable_dynamic_ip = false
  security_group_id = scaleway_instance_security_group.security_group.id

  additional_volume_ids = var.enable_additional_volume ? [scaleway_instance_volume.additional_volume[0].id] : null

  dynamic "private_network" {
    for_each = var.private_network_id != "" ? [var.private_network_id] : []
    content {
      pn_id = private_network.value
    }
  }
}

resource "scaleway_instance_ip" "ipv4" {
  count = var.create_public_ipv4 ? 1 : 0
  type  = "routed_ipv4"
  tags  = var.tags
}

resource "scaleway_instance_ip" "ipv6" {
  count = var.create_public_ipv6 ? 1 : 0
  type  = "routed_ipv6"
  tags  = var.tags
}

resource "scaleway_instance_volume" "additional_volume" {
  count = var.enable_additional_volume == true ? 1 : 0

  type       = var.additional_volume_type
  name       = var.additional_volume_name
  size_in_gb = var.additional_volume_size
  tags       = var.tags
}

resource "scaleway_instance_security_group" "security_group" {
  name                    = var.security_group_name
  inbound_default_policy  = var.inbound_default_policy
  outbound_default_policy = var.outbound_default_policy
  tags                    = var.tags

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

  dynamic "outbound_rule" {
    for_each = var.outbound_security_group_rules
    content {
      action   = outbound_rule.value.action
      ip_range = outbound_rule.value.ip_range
      port     = outbound_rule.value.port
      protocol = outbound_rule.value.protocol
    }
  }
}
