<!-- BEGIN_TF_DOCS -->
# Route Module

Creates a single Azure user-defined route using the standard naming convention:

`ser-route-<topology>-<env>-<location>-<suffix>`

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
# Example variables for the route module.
variable "topology" {
  description = "(Required) Workspace-provided topology category for the example."
  type        = string
}

variable "environment" {
  description = "(Required) Workspace-provided environment for the example."
  type        = string
}
module "route" {
  source  = "app.terraform.io/example-org/route/azurerm"
  version = "x.x.x"

  name_prefix         = "ser"
  resource_group_name = "ser-rg-internal-dev-scu-01"
  route_table_name    = "ser-udr-internal-dev-scu-01"
  topology            = var.topology
  environment         = var.environment
  location            = "southcentralus"
  suffix              = "01"
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"
}
```

## Resources

| Name | Type |
|------|------|
| [azurerm_route.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefix"></a> [address\_prefix](#input\_address\_prefix) | (Required) Address prefix matched by the route. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) Workspace-provided environment for the resource. | `string` | n/a | yes |
| <a name="input_next_hop_type"></a> [next\_hop\_type](#input\_next\_hop\_type) | (Required) Next hop type used by the route. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Resource group name containing the route table. | `string` | n/a | yes |
| <a name="input_route_table_name"></a> [route\_table\_name](#input\_route\_table\_name) | (Required) Route table name where the route will be created. | `string` | n/a | yes |
| <a name="input_topology"></a> [topology](#input\_topology) | (Required) Workspace-provided topology category for the resource. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Optional) Azure region for naming standardization. | `string` | `"southcentralus"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | (Optional) Prefix used in the generated resource name. | `string` | `"ser"` | no |
| <a name="input_next_hop_in_ip_address"></a> [next\_hop\_in\_ip\_address](#input\_next\_hop\_in\_ip\_address) | (Optional) IP address of the next hop when using VirtualAppliance. | `string` | `null` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | (Optional) Two-digit suffix appended to the generated resource name. | `string` | `"01"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Route ID. |
| <a name="output_name"></a> [name](#output\_name) | Route name. |
<!-- END_TF_DOCS -->