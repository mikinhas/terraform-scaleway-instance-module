## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [scaleway_instance_ip.ip](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/instance_ip) | resource |
| [scaleway_instance_security_group.security_group](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/instance_security_group) | resource |
| [scaleway_instance_security_group_rules.rules](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/instance_security_group_rules) | resource |
| [scaleway_instance_server.instance](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/instance_server) | resource |
| [scaleway_instance_volume.additional_volume](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/instance_volume) | resource |
| [scaleway_marketplace_image.image](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/data-sources/marketplace_image) | data source |
| [scaleway_vpc_private_network.private_network](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/data-sources/vpc_private_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_volume_name"></a> [additional\_volume\_name](#input\_additional\_volume\_name) | n/a | `string` | `"default"` | no |
| <a name="input_additional_volume_size"></a> [additional\_volume\_size](#input\_additional\_volume\_size) | n/a | `number` | `10` | no |
| <a name="input_additional_volume_type"></a> [additional\_volume\_type](#input\_additional\_volume\_type) | n/a | `string` | `"b_ssd"` | no |
| <a name="input_enable_additional_volume"></a> [enable\_additional\_volume](#input\_enable\_additional\_volume) | n/a | `bool` | `false` | no |
| <a name="input_enable_default_security"></a> [enable\_default\_security](#input\_enable\_default\_security) | Enable default security | `string` | `"true"` | no |
| <a name="input_external_rules"></a> [external\_rules](#input\_external\_rules) | Enable external rules | `bool` | `true` | no |
| <a name="input_inbound_default_policy"></a> [inbound\_default\_policy](#input\_inbound\_default\_policy) | n/a | `string` | `"drop"` | no |
| <a name="input_instance_image_name"></a> [instance\_image\_name](#input\_instance\_image\_name) | n/a | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | n/a | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_outbound_default_policy"></a> [outbound\_default\_policy](#input\_outbound\_default\_policy) | n/a | `string` | `"accept"` | no |
| <a name="input_private_network_name"></a> [private\_network\_name](#input\_private\_network\_name) | Name of the private\_network | `string` | `""` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | n/a | `string` | `"default_security_group"` | no |
| <a name="input_security_group_rules"></a> [security\_group\_rules](#input\_security\_group\_rules) | n/a | <pre>list(object({<br>    action   = string,<br>    ip_range = string,<br>    port     = number,<br>    protocol = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_private_ip"></a> [instance\_private\_ip](#output\_instance\_private\_ip) | Private Ip of the instance |
| <a name="output_instance_public_ip_id"></a> [instance\_public\_ip\_id](#output\_instance\_public\_ip\_id) | Id of the IP |
