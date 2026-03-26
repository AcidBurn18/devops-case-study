# Module Strategy

This document describes the modular infrastructure-as-code approach represented in this repository.

## Design Intent

The platform used a module-driven Terraform model so that foundational infrastructure and workload enablement could scale without duplicating logic across environments and applications.

The main goals of this approach were:

- reusability
- consistency
- reviewability
- controlled change propagation
- easier onboarding of new application teams

## Core Foundation Modules

The foundational layer included reusable modules for core Azure building blocks such as:

- management groups
- subscriptions
- resource groups
- virtual networks
- subnets
- subnet-owned network security groups
- subnet-owned route tables / UDRs
- reusable rule patterns for NSG and route entries
- hub connectivity and peering

These modules form the base platform layer that downstream workloads depend on.

## Service Modules

Beyond the core foundation, the platform also relied on service-specific modules for higher-level Azure services. In the real environment this pattern supported onboarding at significant scale across many applications.

Representative examples include:

- AKS
- Databricks
- Azure Functions
- SQL Managed Instance
- PostgreSQL
- Redis

This repository does not attempt to recreate all service modules, but it uses the same structural idea and includes sample core modules written in a cleaner open-source friendly form.

## Workspace And Environment Separation

The platform model also separated concerns across workspaces and environments so that changes could be promoted in a controlled way.

Typical structure:

- topology-aware roots
- environment-specific configuration
- shared modules consumed by multiple roots
- CI/CD driven validation and delivery

## Documentation Principle

Module documentation matters as much as the code structure itself. That is why this repository also includes examples of README and input/output documentation patterns inspired by real use of tools like `terraform-docs`.
