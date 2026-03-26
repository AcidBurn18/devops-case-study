# Platform Core Example

This example shows how the sample core modules in this repository can be composed into a topology-aware environment root.

It is intentionally simple and public-safe. The goal is to demonstrate module composition and naming patterns, not to reproduce a full enterprise Landing Zone.

## Included Modules

- resource group
- tags
- virtual network
- subnet
- network security rule
- route

## Usage

```bash
terraform init
terraform plan -var-file=terraform.tfvars.example
```

For a Terraform Enterprise style setup, `topology` and `environment` are defined separately in [`variables.ws.tf`](/Users/iansh/Desktop/Devops-experience/devops-case-study/examples/platform-core/variables.ws.tf) and are expected to come from workspace variables rather than the example tfvars file.

Adjust values before applying in any real environment.
