# Terraform Hetzner Cloud Server Module

This module creates a few resources on Hetzner Cloud.

1. Hetzner Cloud Server
2. Hetzner Cloud Floating IP
3. Hetzner Cloud Firewall
4. Hetzner Cloud Firewall Rule
5. Hetzner Cloud SSH Key

## Getting Started

1. Create a new project on Hetzner Cloud
2. Create a new API Token

## Usage

```hcl
module "server" {
  source = "github.com/terraform-hetznercloud/terraform-hetznercloud-server"
  
  hcloud_token          = var.hcloud_token
  name                  = "my-server"
  image                 = "ubuntu-18.04"
  server_type           = "cx11"
  location              = "nbg1"
  ssh_key_name          = "example"
  enable_floating_ip    = "my-floating-ip"
  create_ssh_key        = true
  firewall_rules = {
    "allow-ssh"  = {
      direction   = "in"
      protocol    = "tcp"
      port        = "22"
      source_ips  = [
        "${chomp(data.http.myip.body)}/32",
      ]
  }
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | 1.35.2 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.2.3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.35.2 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.2.3 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_firewall.this](https://registry.terraform.io/providers/hetznercloud/hcloud/1.35.2/docs/resources/firewall) | resource |
| [hcloud_floating_ip.this](https://registry.terraform.io/providers/hetznercloud/hcloud/1.35.2/docs/resources/floating_ip) | resource |
| [hcloud_network.this](https://registry.terraform.io/providers/hetznercloud/hcloud/1.35.2/docs/resources/network) | resource |
| [hcloud_network_subnet.this](https://registry.terraform.io/providers/hetznercloud/hcloud/1.35.2/docs/resources/network_subnet) | resource |
| [hcloud_rdns.this](https://registry.terraform.io/providers/hetznercloud/hcloud/1.35.2/docs/resources/rdns) | resource |
| [hcloud_server.this](https://registry.terraform.io/providers/hetznercloud/hcloud/1.35.2/docs/resources/server) | resource |
| [hcloud_snapshot.this](https://registry.terraform.io/providers/hetznercloud/hcloud/1.35.2/docs/resources/snapshot) | resource |
| [hcloud_ssh_key.this](https://registry.terraform.io/providers/hetznercloud/hcloud/1.35.2/docs/resources/ssh_key) | resource |
| [local_file.private_key](https://registry.terraform.io/providers/hashicorp/local/2.2.3/docs/resources/file) | resource |
| [local_file.public_key](https://registry.terraform.io/providers/hashicorp/local/2.2.3/docs/resources/file) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/3.0.0/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_ssh_key"></a> [create\_ssh\_key](#input\_create\_ssh\_key) | Create SSH key | `bool` | `true` | no |
| <a name="input_delete_protection"></a> [delete\_protection](#input\_delete\_protection) | Enable delete protection | `bool` | `false` | no |
| <a name="input_enable_backups"></a> [enable\_backups](#input\_enable\_backups) | Enable backups | `bool` | `false` | no |
| <a name="input_enable_floating_ip"></a> [enable\_floating\_ip](#input\_enable\_floating\_ip) | Enable floating IP | `bool` | `null` | no |
| <a name="input_enable_rdns"></a> [enable\_rdns](#input\_enable\_rdns) | Enable reverse DNS | `bool` | `false` | no |
| <a name="input_enable_snapshot"></a> [enable\_snapshot](#input\_enable\_snapshot) | Enable snapshot | `bool` | `false` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | Firewall rules, you can add multiple rules | <pre>map(object({<br>    description = string<br>    direction   = string<br>    protocol    = string<br>    port        = string<br>    source_ips  = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_hcloud_token"></a> [hcloud\_token](#input\_hcloud\_token) | Hetzner Cloud API token | `string` | n/a | yes |
| <a name="input_ipv4_enabled"></a> [ipv4\_enabled](#input\_ipv4\_enabled) | Enable IPv4 | `bool` | `true` | no |
| <a name="input_ipv6_enabled"></a> [ipv6\_enabled](#input\_ipv6\_enabled) | Enable IPv6 | `bool` | `false` | no |
| <a name="input_network_ip_range"></a> [network\_ip\_range](#input\_network\_ip\_range) | IP range of the network | `string` | `"10.0.0.0/16"` | no |
| <a name="input_network_zone"></a> [network\_zone](#input\_network\_zone) | Zone of the network | `string` | `"eu-central"` | no |
| <a name="input_os_image"></a> [os\_image](#input\_os\_image) | Operating system image | `string` | `"ubuntu-20.04"` | no |
| <a name="input_private_server_ip"></a> [private\_server\_ip](#input\_private\_server\_ip) | Private IP of the server | `string` | n/a | yes |
| <a name="input_resverse_dns_name"></a> [resverse\_dns\_name](#input\_resverse\_dns\_name) | Reverse DNS name | `string` | `null` | no |
| <a name="input_server_location"></a> [server\_location](#input\_server\_location) | Location of the server | `string` | `"nbg1"` | no |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | The name of the server | `string` | n/a | yes |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | Type of the server | `string` | n/a | yes |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | The name of the SSH key | `string` | `null` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | SSH keys for the server | `list(string)` | `[]` | no |
| <a name="input_subnet_ip_range"></a> [subnet\_ip\_range](#input\_subnet\_ip\_range) | IP range of the subnet | `string` | `"10.0.1.0/24"` | no |
| <a name="input_subnet_type"></a> [subnet\_type](#input\_subnet\_type) | Type of the subnet | `string` | `"cloud"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_floating_ip"></a> [floating\_ip](#output\_floating\_ip) | The floating IP of the Hetzner server |
| <a name="output_public_key"></a> [public\_key](#output\_public\_key) | The public key of the Hetzner server |
| <a name="output_server_ip4_address"></a> [server\_ip4\_address](#output\_server\_ip4\_address) | The IPv4 address of the Hetzner server |
| <a name="output_server_status"></a> [server\_status](#output\_server\_status) | The status of the Hetzner server |
<!-- END_TF_DOCS -->