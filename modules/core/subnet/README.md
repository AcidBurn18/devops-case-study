<!-- BEGIN_TF_DOCS -->
# Subnet Module

Creates a subnet with subnet-scoped NSG, route table, and merged common/custom rule sets.

Standard naming follows:

`ser-subnet-<topology>-<env>-<location>-<suffix>`

This module is intended for Terraform Enterprise style usage where workspace variables provide `topology` and `env`.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.0 |

# Examples

```hcl
# Example variables for the subnet module.
variable "topology" {
  description = "(Required) Workspace-provided topology category for the example."
  type        = string
}

variable "environment" {
  description = "(Required) Workspace-provided environment for the example."
  type        = string
}
module "subnet" {
  source  = "app.terraform.io/example-org/subnet/azurerm"
  version = "x.x.x"

  name_prefix          = "ser"
  resource_group_name  = "ser-rg-internal-dev-scu-01"
  virtual_network_name = "ser-vnet-internal-dev-scu-01"
  topology             = var.topology
  environment          = var.environment
  location             = "southcentralus"
  suffix               = "01"
  address_prefixes     = ["10.10.1.0/24"]
  service_endpoints    = ["Microsoft.Storage"]

  common_nsg_rules = [
    {
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]

  custom_nsg_rules = []

  common_udr_routes = [
    {
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "Internet"
    }
  ]

  custom_udr_routes = []

  tags = {
    application = "landing-zone"
    owner       = "platform-team"
  }
}
```

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_route.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route_table.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | (Required) Address prefixes assigned to the subnet. | `list(string)` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) Workspace-provided environment for the resource. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Resource group name containing the subnet resources. | `string` | n/a | yes |
| <a name="input_topology"></a> [topology](#input\_topology) | (Required) Workspace-provided topology category for the resource. | `string` | n/a | yes |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | (Required) Virtual network name where the subnet will be created. | `string` | n/a | yes |
| <a name="input_common_nsg_rules"></a> [common\_nsg\_rules](#input\_common\_nsg\_rules) | (Optional) Common NSG rules merged with custom subnet rules. | <pre>list(object({<br/>    suffix                     = optional(string)<br/>    priority                   = number<br/>    direction                  = string<br/>    access                     = string<br/>    protocol                   = string<br/>    source_port_range          = string<br/>    destination_port_range     = string<br/>    source_address_prefix      = string<br/>    destination_address_prefix = string<br/>  }))</pre> | `[]` | no |
| <a name="input_common_udr_routes"></a> [common\_udr\_routes](#input\_common\_udr\_routes) | (Optional) Common user-defined routes merged with custom subnet routes. | <pre>list(object({<br/>    suffix                 = optional(string)<br/>    address_prefix         = string<br/>    next_hop_type          = string<br/>    next_hop_in_ip_address = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_custom_nsg_rules"></a> [custom\_nsg\_rules](#input\_custom\_nsg\_rules) | (Optional) Custom NSG rules merged with the common subnet rules. | <pre>list(object({<br/>    suffix                     = optional(string)<br/>    priority                   = number<br/>    direction                  = string<br/>    access                     = string<br/>    protocol                   = string<br/>    source_port_range          = string<br/>    destination_port_range     = string<br/>    source_address_prefix      = string<br/>    destination_address_prefix = string<br/>  }))</pre> | `[]` | no |
| <a name="input_custom_udr_routes"></a> [custom\_udr\_routes](#input\_custom\_udr\_routes) | (Optional) Custom user-defined routes merged with the common subnet routes. | <pre>list(object({<br/>    suffix                 = optional(string)<br/>    address_prefix         = string<br/>    next_hop_type          = string<br/>    next_hop_in_ip_address = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | (Optional) Azure region for the subnet resources. | `string` | `"southcentralus"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | (Optional) Prefix used in generated resource names. | `string` | `"ser"` | no |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | (Optional) Azure service endpoints enabled on the subnet. | `list(string)` | `[]` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | (Optional) Two-digit suffix appended to generated resource names. | `string` | `"01"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Tags applied to NSG and route table resources created by this module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Subnet ID. |
| <a name="output_name"></a> [name](#output\_name) | Subnet name. |
| <a name="output_network_security_group_id"></a> [network\_security\_group\_id](#output\_network\_security\_group\_id) | Subnet NSG ID. |
| <a name="output_route_table_id"></a> [route\_table\_id](#output\_route\_table\_id) | Subnet route table ID. |
<!-- END_TF_DOCS -->