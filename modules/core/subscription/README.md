<!-- BEGIN_TF_DOCS -->
# Subscription Module

Creates a new subscription alias or standardizes an existing subscription for placement within the landing zone hierarchy.

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
variable "subscription_id" {
  description = "(Optional) Existing subscription GUID for the example."
  type        = string
  default     = null
}

variable "billing_scope_id" {
  description = "(Optional) Billing scope used when the example creates a new subscription."
  type        = string
  default     = null
}

variable "management_group_id" {
  description = "(Optional) Management group ID used for the example association."
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
module "subscription" {
  source  = "app.terraform.io/example-org/subscription/azurerm"
  version = "x.x.x"

  topology            = var.topology
  environment         = var.environment
  subscription_name   = "platform-dev-subscription"
  subscription_id     = var.subscription_id
  billing_scope_id    = var.billing_scope_id
  management_group_id = var.management_group_id
  workload            = "DevTest"
  tags = {
    owner       = "platform-team"
    cost_center = "shared-platform"
  }
}
```

## Resources

| Name | Type |
|------|------|
| [azurerm_management_group_subscription_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_subscription_association) | resource |
| [azurerm_subscription.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription) | resource |
| [azurerm_subscription.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) Workspace-provided environment for the module context. | `string` | n/a | yes |
| <a name="input_subscription_name"></a> [subscription\_name](#input\_subscription\_name) | (Required) Subscription display name. This is used for new subscription creation and for documentation of existing subscriptions. | `string` | n/a | yes |
| <a name="input_topology"></a> [topology](#input\_topology) | (Required) Workspace-provided topology category for the module context. | `string` | n/a | yes |
| <a name="input_alias"></a> [alias](#input\_alias) | (Optional) Subscription alias. When omitted, a stable alias is generated from the module context. | `string` | `null` | no |
| <a name="input_billing_scope_id"></a> [billing\_scope\_id](#input\_billing\_scope\_id) | (Optional) Billing scope used when creating a new subscription alias. | `string` | `null` | no |
| <a name="input_management_group_id"></a> [management\_group\_id](#input\_management\_group\_id) | (Optional) Management group ID used to associate the subscription to the landing zone hierarchy. | `string` | `null` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | (Optional) Existing Azure subscription GUID. When provided, the module manages placement and metadata for the existing subscription instead of creating a new one. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Tags applied when the module creates a new subscription. | `map(string)` | `{}` | no |
| <a name="input_workload"></a> [workload](#input\_workload) | (Optional) Subscription workload classification used when creating a new subscription. | `string` | `"Production"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_display_name"></a> [display\_name](#output\_display\_name) | Subscription display name. |
| <a name="output_id"></a> [id](#output\_id) | Subscription resource ID. |
| <a name="output_management_group_association_id"></a> [management\_group\_association\_id](#output\_management\_group\_association\_id) | Management group association ID when the subscription is attached to a management group. |
| <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id) | Subscription GUID. |
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id) | Tenant ID that owns the subscription. |
<!-- END_TF_DOCS -->