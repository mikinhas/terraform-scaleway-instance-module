output "instance_public_ip_id" {
  value       = scaleway_instance_ip.ip.id
  description = "Id of the IP"
}
