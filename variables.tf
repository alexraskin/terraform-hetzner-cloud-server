variable "hcloud_token" {
  type        = string
  description = "Hetzner Cloud API token"
}

variable "server_name" {
  type        = string
  description = "The name of the server"
}

variable "server_location" {
  type        = string
  description = "Location of the server"
  default     = "nbg1"
}

variable "ssh_key_name" {
  type        = string
  description = "The name of the SSH key"
  default     = null
}

variable "network_ip_range" {
  type        = string
  description = "IP range of the network"
  default     = "10.0.0.0/16"
}

variable "subnet_type" {
  type        = string
  description = "Type of the subnet"
  default     = "cloud"
}

variable "network_zone" {
  type        = string
  description = "Zone of the network"
  default     = "eu-central"
}

variable "subnet_ip_range" {
  type        = string
  description = "IP range of the subnet"
  default     = "10.0.1.0/24"
}

variable "private_server_ip" {
  type        = string
  description = "Private IP of the server"
}

variable "firewall_rules" {
  type = map(object({
    description = string
    direction   = string
    protocol    = string
    port        = string
    source_ips  = list(string)
  }))
  description = "Firewall rules, you can add multiple rules"
}

variable "os_image" {
  type        = string
  description = "Operating system image"
  default     = "ubuntu-20.04"
}

variable "server_type" {
  type        = string
  description = "Type of the server"
}

variable "tags" {
  type        = map(string)
  description = "Tags for resources"
  default     = {}
}

variable "ssh_keys" {
  type        = list(string)
  description = "SSH keys for the server"
  default     = []
}

variable "ipv4_enabled" {
  type        = bool
  description = "Enable IPv4"
  default     = true
}

variable "ipv6_enabled" {
  type        = bool
  description = "Enable IPv6"
  default     = false
}

variable "enable_floating_ip" {
  type        = bool
  description = "Enable floating IP"
  default     = null
}

variable "create_ssh_key" {
  type        = bool
  description = "Create SSH key"
  default     = true
}

variable "enable_snapshot" {
  type        = bool
  description = "Enable snapshot"
  default     = false
}

variable "resverse_dns_name" {
  type        = string
  description = "Reverse DNS name"
  default     = null
}

variable "enable_rdns" {
  type        = bool
  description = "Enable reverse DNS"
  default     = false
}

variable "enable_backups" {
  type        = bool
  description = "Enable backups"
  default     = false
}

variable "delete_protection" {
  type        = bool
  description = "Enable delete protection"
  default     = false
}
