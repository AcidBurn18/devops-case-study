<!-- BEGIN_TF_DOCS -->
# Network Security Rule Module

Creates a single Azure network security rule using the standard naming convention:

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
# Example variables for the network security rule module.
variable "topology" {
  description = "(Required) Workspace-provided topology category for the example."
  type        = string
}

variable "environment" {
  description = "(Required) Workspace-provided environment for the example."
  type        = string
}
module "network_security_rule" {
  source  = "app.terraform.io/example-org/network-security-rule/azurerm"
  version = "x.x.x"

  name_prefix                 = "ser"
  resource_group_name         = "ser-rg-internal-dev-scu-01"
  network_security_group_name = "ser-nsg-internal-dev-scu-01"
  topology                    = var.topology
  environment                 = var.environment
  location                    = "southcentralus"
  suffix                      = "01"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}
```

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_nsg_rules"></a> [common\_nsg\_rules](#input\_common\_nsg\_rules) | (Required) List of common NSG rules. | <pre>map(object({<br/>    priority                    = number<br/>    direction                   = string<br/>    access                      = string<br/>    protocol                    = string<br/>    source_port_range           = string<br/>    source_port_ranges          = list(string)<br/>    destination_port_range      = string<br/>    destination_port_ranges     = list(string)<br/>    source_address_prefix       = string<br/>    source_address_prefixes     = list(string)<br/>    destination_address_prefix  = string<br/>    destination_address_prefixes = list(string)<br/>  }))</pre> | `{}` | no |
| <a name="input_custom_nsg_rules"></a> [custom\_nsg\_rules](#input\_custom\_nsg\_rules) | (Optional) List of custom NSG rules. | <pre>map(object({<br/>    priority                    = number<br/>    direction                   = string<br/>    access                      = string<br/>    protocol                    = string<br/>    source_port_range           = string<br/>    source_port_ranges          = list(string)<br/>    destination_port_range      = string<br/>    destination_port_ranges     = list(string)<br/>    source_address_prefix       = string<br/>    source_address_prefixes     = list(string)<br/>    destination_address_prefix  = string<br/>    destination_address_prefixes = list(string)<br/>  }))</pre> | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | (Optional) Azure region for naming standardization. | `string` | `"southcentralus"` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | (Optional) Two-digit suffix appended to the generated resource name. | `string` | `"01"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->