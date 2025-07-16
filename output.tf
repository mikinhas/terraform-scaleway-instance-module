output "instance_public_ipv4_id" {
  value       = scaleway_instance_ip.ipv4[*].id
  description = "Id of the ipv4"
}

output "instance_public_ipv4" {
  value       = scaleway_instance_ip.ipv4[*].address
  description = "Public Address of the Instance"
}

output "instance_private_ip" {
  value       = scaleway_instance_server.instance.private_ip
  description = "Private Ip of the instance"
}
