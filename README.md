## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement\_scaleway) | ~> 2.57 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | ~> 2.57 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [scaleway_block_volume.additional_volumes](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/block_volume) | resource |
| [scaleway_instance_ip.ipv4](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/instance_ip) | resource |
| [scaleway_instance_ip.ipv6](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/instance_ip) | resource |
| [scaleway_instance_security_group.security_group](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/instance_security_group) | resource |
| [scaleway_instance_security_group_rules.rules](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/instance_security_group_rules) | resource |
| [scaleway_instance_server.instance](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/instance_server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_volumes"></a> [additional\_volumes](#input\_additional\_volumes) | List of additional block volumes to create and attach | <pre>list(object({<br/>    name = string<br/>    size = number<br/>    iops = optional(number, 5000)<br/>  }))</pre> | `[]` | no |
| <a name="input_create_public_ipv4"></a> [create\_public\_ipv4](#input\_create\_public\_ipv4) | If true, create public IPv4 address | `bool` | `true` | no |
| <a name="input_create_public_ipv6"></a> [create\_public\_ipv6](#input\_create\_public\_ipv6) | If true, create public IPv6 address | `bool` | `true` | no |
| <a name="input_enable_default_security"></a> [enable\_default\_security](#input\_enable\_default\_security) | Enable default security | `bool` | `true` | no |
| <a name="input_external_rules"></a> [external\_rules](#input\_external\_rules) | Enable external rules | `bool` | `true` | no |
| <a name="input_inbound_default_policy"></a> [inbound\_default\_policy](#input\_inbound\_default\_policy) | Default policy for inbound traffic | `string` | `"drop"` | no |
| <a name="input_instance_image_name"></a> [instance\_image\_name](#input\_instance\_image\_name) | Image name for the instance (e.g., ubuntu\_jammy) | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the instance | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type (e.g., DEV1-S, GP1-S) | `string` | n/a | yes |
| <a name="input_outbound_default_policy"></a> [outbound\_default\_policy](#input\_outbound\_default\_policy) | Default policy for outbound traffic | `string` | `"accept"` | no |
| <a name="input_outbound_security_group_rules"></a> [outbound\_security\_group\_rules](#input\_outbound\_security\_group\_rules) | List of outbound security group rules (empty = allow all by default) | <pre>list(object({<br/>    action   = string<br/>    ip_range = string<br/>    port     = number<br/>    protocol = string<br/>  }))</pre> | `[]` | no |
| <a name="input_private_network_id"></a> [private\_network\_id](#input\_private\_network\_id) | ID of the private network to attach | `string` | `""` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Name of the security group | `string` | `"default_security_group"` | no |
| <a name="input_security_group_rules"></a> [security\_group\_rules](#input\_security\_group\_rules) | List of inbound security group rules | <pre>list(object({<br/>    action   = string<br/>    ip_range = string<br/>    port     = number<br/>    protocol = string<br/>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_additional_volume_ids"></a> [additional\_volume\_ids](#output\_additional\_volume\_ids) | Map of additional block volume names to their IDs |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | ID of the instance |
| <a name="output_instance_private_ips"></a> [instance\_private\_ips](#output\_instance\_private\_ips) | Private IPs of the instance |
| <a name="output_instance_public_ipv4"></a> [instance\_public\_ipv4](#output\_instance\_public\_ipv4) | Public IPv4 address of the instance |
| <a name="output_instance_public_ipv4_id"></a> [instance\_public\_ipv4\_id](#output\_instance\_public\_ipv4\_id) | ID of the public IPv4 address |
| <a name="output_instance_public_ipv6"></a> [instance\_public\_ipv6](#output\_instance\_public\_ipv6) | Public IPv6 address of the instance |
| <a name="output_instance_public_ipv6_id"></a> [instance\_public\_ipv6\_id](#output\_instance\_public\_ipv6\_id) | ID of the public IPv6 address |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | ID of the security group |
