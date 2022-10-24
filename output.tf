output "instance_public_ip_id" {
  value       = scaleway_instance_ip.ip[*].id
  description = "Id of the IP"
}

output "instance_private_ip" {
  value       = scaleway_instance_server.instance.private_ip
  description = "Private Ip of the instance"
}
