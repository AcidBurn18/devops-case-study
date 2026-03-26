<!-- BEGIN_TF_DOCS -->
# Hub Peering Module

Documents the hub peering pattern used in this repository.

This module is intended for Terraform Enterprise style usage where workspace variables provide `topology` and `env`.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |

## Providers

No providers.

# Examples

```hcl
# Example variables for the hub peering module.
variable "topology" {
  description = "(Required) Workspace-provided topology category for the example."
  type        = string
}

variable "environment" {
  description = "(Required) Workspace-provided environment for the example."
  type        = string
}
module "hub_peering" {
  source  = "app.terraform.io/example-org/hub-peering/azurerm"
  version = "x.x.x"

  topology    = var.topology
  environment = var.environment
}
```

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) Workspace-provided environment for the module context. | `string` | n/a | yes |
| <a name="input_topology"></a> [topology](#input\_topology) | (Required) Workspace-provided topology category for the module context. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->