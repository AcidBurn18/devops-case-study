<!-- BEGIN_TF_DOCS -->
# Network Security Rule Module

Creates a single Azure network security rule using the standard naming convention:

`ser-nsgrule-<topology>-<env>-<location>-<suffix>`

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
| <a name="input_access"></a> [access](#input\_access) | (Required) Access action for the rule. | `string` | n/a | yes |
| <a name="input_destination_address_prefix"></a> [destination\_address\_prefix](#input\_destination\_address\_prefix) | (Required) Destination address prefix for the rule. | `string` | n/a | yes |
| <a name="input_destination_port_range"></a> [destination\_port\_range](#input\_destination\_port\_range) | (Required) Destination port range for the rule. | `string` | n/a | yes |
| <a name="input_direction"></a> [direction](#input\_direction) | (Required) Traffic direction for the rule. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) Workspace-provided environment for the resource. | `string` | n/a | yes |
| <a name="input_network_security_group_name"></a> [network\_security\_group\_name](#input\_network\_security\_group\_name) | (Required) Target NSG name for the rule. | `string` | n/a | yes |
| <a name="input_priority"></a> [priority](#input\_priority) | (Required) Priority of the NSG rule. | `number` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | (Required) Protocol for the rule. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Resource group name containing the target NSG. | `string` | n/a | yes |
| <a name="input_source_address_prefix"></a> [source\_address\_prefix](#input\_source\_address\_prefix) | (Required) Source address prefix for the rule. | `string` | n/a | yes |
| <a name="input_source_port_range"></a> [source\_port\_range](#input\_source\_port\_range) | (Required) Source port range for the rule. | `string` | n/a | yes |
| <a name="input_topology"></a> [topology](#input\_topology) | (Required) Workspace-provided topology category for the resource. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Optional) Azure region for naming standardization. | `string` | `"southcentralus"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | (Optional) Prefix used in the generated resource name. | `string` | `"ser"` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | (Optional) Two-digit suffix appended to the generated resource name. | `string` | `"01"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | NSG rule ID. |
| <a name="output_name"></a> [name](#output\_name) | NSG rule name. |
<!-- END_TF_DOCS -->