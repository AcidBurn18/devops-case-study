<!-- BEGIN_TF_DOCS -->
# Virtual Network Module

Creates a single Azure virtual network and optionally configures bidirectional peering.

Standard naming follows:

`ser-vnet-<topology>-<env>-<location>-<suffix>`

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
variable "name" {
  description = "(Required) Resource group name used by the virtual network example."
  type        = string
}

variable "location" {
  description = "(Required) Azure region used by the virtual network example."
  type        = string
}
variable "topology" {
  description = "(Required) Workspace-provided topology category for the example."
  type        = string
}

variable "environment" {
  description = "(Required) Workspace-provided environment for the example."
  type        = string
}
module "virtual_network" {
  source  = "app.terraform.io/example-org/virtual-network/azurerm"
  version = "x.x.x"

  resource_group_name = var.name
  topology            = var.topology
  environment         = var.environment
  location            = var.location
  address_space       = ["#.#.#.#/#"]

  remote_virtual_network_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/ser-rg-hybrid-dev-ncu-01/providers/Microsoft.Network/virtualNetworks/ser-vnet-hybrid-dev-ncu-01"
  remote_virtual_network_name = "ser-vnet-hybrid-dev-ncu-01"
  remote_resource_group_name  = "ser-rg-hybrid-dev-ncu-01"
}
```

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.local_to_remote](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.remote_to_local](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | (Required) Address space assigned to the virtual network. | `list(string)` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | (Required) Common tags merged into the final virtual network tags. | `map(string)` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) Workspace-provided environment for the resource. | `string` | n/a | yes |
| <a name="input_remote_resource_group_name"></a> [remote\_resource\_group\_name](#input\_remote\_resource\_group\_name) | (Required) Remote resource group name used for reverse peering. | `string` | n/a | yes |
| <a name="input_remote_virtual_network_id"></a> [remote\_virtual\_network\_id](#input\_remote\_virtual\_network\_id) | (Required) Remote virtual network ID used to create peering. | `string` | n/a | yes |
| <a name="input_remote_virtual_network_name"></a> [remote\_virtual\_network\_name](#input\_remote\_virtual\_network\_name) | (Required) Remote virtual network name used for reverse peering. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Resource group name where the virtual network will be created. | `string` | n/a | yes |
| <a name="input_topology"></a> [topology](#input\_topology) | (Required) Workspace-provided topology category for the resource. | `string` | n/a | yes |
| <a name="input_allow_forwarded_traffic"></a> [allow\_forwarded\_traffic](#input\_allow\_forwarded\_traffic) | (Optional) Whether forwarded traffic is allowed through the peering. | `bool` | `true` | no |
| <a name="input_allow_gateway_transit"></a> [allow\_gateway\_transit](#input\_allow\_gateway\_transit) | (Optional) Whether gateway transit is allowed from the local virtual network. | `bool` | `false` | no |
| <a name="input_allow_virtual_network_access"></a> [allow\_virtual\_network\_access](#input\_allow\_virtual\_network\_access) | (Optional) Whether peered virtual networks can access each other. | `bool` | `true` | no |
| <a name="input_custom_tags"></a> [custom\_tags](#input\_custom\_tags) | (Optional) Custom tags merged on top of the common tags. | `map(string)` | `{}` | no |
| <a name="input_ddos_protection_plan_id"></a> [ddos\_protection\_plan\_id](#input\_ddos\_protection\_plan\_id) | (Optional) DDoS protection plan ID associated with the virtual network. | `string` | `null` | no |
| <a name="input_enable_ddos_protection"></a> [enable\_ddos\_protection](#input\_enable\_ddos\_protection) | (Optional) Whether DDoS protection is enabled when a plan ID is supplied. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | (Optional) Azure region for the virtual network. | `string` | `"southcentralus"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | (Optional) Prefix used in the generated resource name. | `string` | `"ser"` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | (Optional) Two-digit suffix appended to the generated resource name. | `string` | `"01"` | no |
| <a name="input_use_remote_gateways"></a> [use\_remote\_gateways](#input\_use\_remote\_gateways) | (Optional) Whether the local virtual network uses remote gateways. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_space"></a> [address\_space](#output\_address\_space) | Configured address space for the virtual network. |
| <a name="output_id"></a> [id](#output\_id) | Virtual network ID. |
| <a name="output_name"></a> [name](#output\_name) | Virtual network name. |
<!-- END_TF_DOCS -->