<!-- BEGIN_TF_DOCS -->
# Resource Group Module

Creates a single Azure resource group using the standard naming convention:

`ser-rg-<topology>-<env>-<location>-<suffix>`

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
variable "name" {}
variable "location" {}
variable "topology" {
  description = "(Required) Workspace-provided topology category for the example."
  type        = string
}

variable "env" {
  description = "(Required) Workspace-provided environment for the example."
  type        = string
}
module "resource_group" {
  source  = "app.terraform.io/example-org/resource-group/azurerm"
  version = "x.x.x"

  name        = var.name
  location    = var.location
  topology    = var.topology
  env         = var.env
}
```

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | (Required) Workspace-provided environment for the resource. | `string` | n/a | yes |
| <a name="input_topology"></a> [topology](#input\_topology) | (Required) Workspace-provided topology category for the resource. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Optional) Azure region for the resource group. | `string` | `"southcentralus"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | (Optional) Prefix used in the generated resource name. | `string` | `"ser"` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | (Optional) Two-digit suffix appended to the generated resource name. | `string` | `"01"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Tags applied to the resource group. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource group ID. |
| <a name="output_location_short"></a> [location\_short](#output\_location\_short) | Short code derived from the selected location. |
| <a name="output_name"></a> [name](#output\_name) | Resource group name. |
<!-- END_TF_DOCS -->