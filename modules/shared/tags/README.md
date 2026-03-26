<!-- BEGIN_TF_DOCS -->
# Tags Module

Merges common and custom tags into a single output map for downstream modules.

This module is intended for Terraform Enterprise style usage where workspace variables provide `topology` and `env`.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |

## Providers

No providers.

# Examples

```hcl
# Example variables for the tags module.
variable "topology" {
  description = "(Required) Workspace-provided topology category for the example."
  type        = string
}

variable "environment" {
  description = "(Required) Workspace-provided environment for the example."
  type        = string
}
module "tags" {
  source  = "app.terraform.io/example-org/tags/local"
  version = "x.x.x"

  topology    = var.topology
  environment = var.environment
  common_tags = {
    project     = "azure-landing-zone-starter"
    managed_by  = "terraform"
    environment = var.environment
    topology    = var.topology
  }
  custom_tags = {
    owner = "platform-team"
  }
}
```

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | (Required) Common tags applied across all resources. | `map(string)` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) Workspace-provided environment for the module context. | `string` | n/a | yes |
| <a name="input_topology"></a> [topology](#input\_topology) | (Required) Workspace-provided topology category for the module context. | `string` | n/a | yes |
| <a name="input_custom_tags"></a> [custom\_tags](#input\_custom\_tags) | (Optional) Custom tags merged on top of the common tags. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tags"></a> [tags](#output\_tags) | Merged tag set used by downstream modules. |
<!-- END_TF_DOCS -->