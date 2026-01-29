module "simple_instance_without_public_ip" {
  source = "../../"

  instance_name       = "test_simple_instance_without_public_ip"
  instance_type       = var.instance_type
  instance_image_name = var.instance_image_name

  private_network_id = var.private_network_id

  security_group_name = "test_simple_instance_without_public_ip"
  security_group_rules = [
    {
      action   = "accept"
      ip_range = "0.0.0.0/0"
      port     = 22
      protocol = "TCP"
    },
  ]

  create_public_ipv4 = false
  create_public_ipv6 = false
}
