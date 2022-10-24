module "simple_instance_with_pulic_ip" {
  source     = "../../"
  project_id = var.project_id

  instance_name       = "test_simple_instance_without_public_ip"
  instance_type       = var.instance_type
  instance_image_name = var.instance_image_name

  security_group_name = "test_simple_instance_without_public_ip"
  security_group_rules = [
    {
      action   = "accept"
      ip_range = "0.0.0.0/0"
      port     = 22
      protocol = "TCP"
    },
  ]

  create_public_ip = false
}
