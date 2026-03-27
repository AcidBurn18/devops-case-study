<!-- BEGIN_TF_DOCS -->
# Management Group Module

Creates a management group aligned to the landing zone topology and environment model used in this repository.

This module is intended for Terraform Enterprise style usage where workspace variables provide `topology` and `environment`.

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
variable "parent_management_group_id" {
  description = "(Optional) Parent management group ID for the example hierarchy."
  type        = string
  default     = null
}
variable "topology" {
  description = "(Required) Workspace-provided topology category for the example."
  type        = string
}

variable "environment" {
  description = "(Required) Workspace-provided environment for the example."
  type        = string
}
module "management_group" {
  source  = "app.terraform.io/example-org/management-group/azurerm"
  version = "x.x.x"

  name_prefix                = "platform"
  topology                   = var.topology
  environment                = var.environment
  display_name               = format("Platform %s", upper(var.environment))
  parent_management_group_id = var.parent_management_group_id
}
```

## Resources

| Name | Type |
|------|------|
| [azurerm_management_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) Workspace-provided environment for the module context. | `string` | n/a | yes |
| <a name="input_topology"></a> [topology](#input\_topology) | (Required) Workspace-provided topology category for the module context. | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | (Optional) Friendly display name for the management group. When omitted, a display name is generated from topology and environment. | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | (Optional) Prefix used in the generated management group name. | `string` | `"platform"` | no |
| <a name="input_parent_management_group_id"></a> [parent\_management\_group\_id](#input\_parent\_management\_group\_id) | (Optional) Parent management group ID used to nest this management group in the landing zone hierarchy. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_display_name"></a> [display\_name](#output\_display\_name) | Management group display name. |
| <a name="output_id"></a> [id](#output\_id) | Management group resource ID. |
| <a name="output_name"></a> [name](#output\_name) | Management group name. |
<!-- END_TF_DOCS -->