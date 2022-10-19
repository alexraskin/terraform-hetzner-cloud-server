provider "hcloud" {
  token = var.hcloud_token
}

locals {
  ssh_keys = concat([hcloud_ssh_key.this[0].id], var.ssh_keys)
}

resource "hcloud_server" "this" {
  name              = "${var.server_name}-${var.server_location}"
  server_type       = var.server_type
  image             = var.os_image
  location          = var.server_location
  backups           = var.enable_backups
  delete_protection = var.delete_protection
  ssh_keys          = local.ssh_keys
  firewall_ids      = [hcloud_firewall.this.id]

  network {
    network_id = hcloud_network.this.id
    ip         = var.private_server_ip
  }
  public_net {
    ipv4_enabled = var.ipv4_enabled
    ipv6_enabled = var.ipv6_enabled
  }

  depends_on = [
    hcloud_network_subnet.this,
    tls_private_key.this,
  ]
  labels = var.tags
}

resource "hcloud_firewall" "this" {
  name = "${var.server_name}-${var.server_location}-firewall"
  dynamic "rule" {
    for_each = var.firewall_rules
    iterator = firewall_rules
    content {
      description = firewall_rules.value["description"]
      direction   = firewall_rules.value["direction"]
      protocol    = firewall_rules.value["protocol"]
      port        = firewall_rules.value["port"]
      source_ips  = flatten(firewall_rules.value["source_ips"])
    }
  }
  labels = var.tags
}

resource "hcloud_snapshot" "this" {
  count       = var.enable_snapshot ? 1 : 0
  server_id   = hcloud_server.this.id
  description = "Snapshot of ${hcloud_server.this.name}"
}

resource "hcloud_network" "this" {
  name     = "${var.server_name}-${var.server_location}-network"
  ip_range = var.network_ip_range
}

resource "hcloud_network_subnet" "this" {
  type         = var.subnet_type
  network_id   = hcloud_network.this.id
  network_zone = var.network_zone
  ip_range     = var.subnet_ip_range
}

resource "hcloud_floating_ip" "this" {
  count     = var.enable_floating_ip ? 1 : 0
  type      = "ipv4"
  server_id = hcloud_server.this.id
  depends_on = [
    hcloud_server.this
  ]
}

resource "hcloud_rdns" "this" {
  count      = var.enable_rdns ? 1 : 0
  server_id  = hcloud_server.this.id
  ip_address = hcloud_server.this.ipv4_address
  dns_ptr    = var.resverse_dns_name
}
