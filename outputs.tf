output "server_ip4_address" {
  value       = hcloud_server.this.ipv4_address
  description = "The IPv4 address of the Hetzner server"
}

output "server_status" {
  value       = hcloud_server.this.status
  description = "The status of the Hetzner server"
}

output "public_key" {
  value       = var.create_ssh_key ? tls_private_key.this.public_key : null
  description = "The public key of the Hetzner server"
}

out "floating_ip" {
  value       = var.enable_floating_ip ? hcloud_floating_ip.this.ip : null
  description = "The floating IP of the Hetzner server"
}
