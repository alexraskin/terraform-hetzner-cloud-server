resource "tls_private_key" "this" {
  count     = var.create_ssh_key ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "local_file" "private_key" {
  count           = var.create_ssh_key ? 1 : 0
  content         = tls_private_key.this.private_key
  filename        = "${var.ssh_key_name}.pem"
  file_permission = "0600"
}

resource "local_file" "public_key" {
  count           = var.create_ssh_key ? 1 : 0
  content         = tls_private_key.this.public_key
  filename        = "${var.ssh_key_name}.pub"
  file_permission = "0600"
}

resource "hcloud_ssh_key" "this" {
  count      = var.create_ssh_key ? 1 : 0
  name       = local_file.public_key.filename
  public_key = tls_private_key.this.public_key
  labels     = var.tags
}
