output "instance_id" {
  value       = scaleway_instance_server.instance.id
  description = "ID of the instance"
}

output "instance_public_ipv4_id" {
  value       = scaleway_instance_ip.ipv4[*].id
  description = "ID of the public IPv4 address"
}

output "instance_public_ipv4" {
  value       = scaleway_instance_ip.ipv4[*].address
  description = "Public IPv4 address of the instance"
}

output "instance_public_ipv6_id" {
  value       = scaleway_instance_ip.ipv6[*].id
  description = "ID of the public IPv6 address"
}

output "instance_public_ipv6" {
  value       = scaleway_instance_ip.ipv6[*].address
  description = "Public IPv6 address of the instance"
}

output "instance_private_ips" {
  value       = scaleway_instance_server.instance.private_ips
  description = "Private IPs of the instance"
}

output "security_group_id" {
  value       = scaleway_instance_security_group.security_group.id
  description = "ID of the security group"
}

output "additional_volume_id" {
  value       = var.enable_additional_volume ? scaleway_instance_volume.additional_volume[0].id : null
  description = "ID of the additional volume (null if not enabled)"
}
