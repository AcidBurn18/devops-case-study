# Azure Landing Zone Starter

A public-safe open-source starter project inspired by my hands-on Azure Landing Zone and platform engineering experience across design, operations, governance, reusable Terraform modules, and application onboarding at scale.

This repository is meant to show how I think about building a cloud foundation, not to publish employer-owned code. It combines documentation, sample Terraform modules, example roots, and architecture guidance in a format that is safe for GitHub and useful as a portfolio project.

## Purpose

The goal of this repository is to present Azure platform engineering experience in a way that is:

- technically credible
- safe to share publicly
- useful for interviews, applications, and portfolio review
- focused on design thinking, governance, automation, and DevOps practices

## What This Project Covers

- Azure Landing Zone concepts
- greenfield platform foundation thinking
- subscription and environment organization
- identity and access considerations
- policy and governance thinking
- topology-aware network patterns
- infrastructure-as-code driven platform setup
- CI/CD and operational standardization
- observability and platform operations
- reusable Terraform module structure
- sample root configuration for core platform resources

## Public-Safe Scope

This repository does **not** include:

- real company names
- customer names
- internal IP ranges
- tenant-specific identifiers
- secrets, credentials, tokens, or certificates
- exact production topology
- employer-owned source code copied verbatim

Instead, it contains generalized architecture patterns, module structures, and sample code written from scratch to reflect real experience safely.

## Repository Structure

```text
devops-case-study/
├── .github/workflows/
├── README.md
├── examples/
│   └── platform-core/
├── modules/
│   ├── core/
│   └── network/
└── docs/
    ├── experience.md
    ├── overview.md
    ├── architecture.md
    ├── topologies.md
    ├── modules.md
    ├── operating-model.md
    └── public-safety.md
```

## What Is Included

### Documentation

- architectural overview
- topology model
- operating model
- public-safety boundaries
- module strategy
- experience summary

### Sample Terraform Assets

- core module skeletons for:
  - resource groups
  - virtual networks
  - NSGs
  - route tables
- documentation-first placeholders for:
  - management groups
  - subscriptions
  - hub peering
- an example root composition under [`examples/platform-core/`](/Users/iansh/Desktop/Devops-experience/devops-case-study/examples/platform-core)

### Delivery Support

- sample GitHub Actions formatting workflow
- clean module-oriented repository layout

## Experience Themes Behind This Repo

This repository is centered on the kind of platform work typically involved in an Azure Landing Zone journey:

- creating a scalable cloud foundation
- contributing to greenfield platform setup
- separating environments and responsibilities
- applying governance and policy controls
- standardizing network and identity patterns
- enabling repeatable deployments through automation
- supporting downstream application teams with a stable platform
- building reusable modules consumed across many workloads

## Why This Repository Exists

I want this repo to show that my DevOps experience is not limited to running services, but also includes platform-level engineering:

- cloud foundation design
- modular Terraform design
- governance-aware infrastructure
- repeatable deployment patterns
- operational maturity
- balancing security, scalability, and delivery speed

## Recommended Reading Order

1. [`docs/overview.md`](/Users/iansh/Desktop/Devops-experience/devops-case-study/docs/overview.md)
2. [`docs/architecture.md`](/Users/iansh/Desktop/Devops-experience/devops-case-study/docs/architecture.md)
3. [`docs/topologies.md`](/Users/iansh/Desktop/Devops-experience/devops-case-study/docs/topologies.md)
4. [`docs/modules.md`](/Users/iansh/Desktop/Devops-experience/devops-case-study/docs/modules.md)
5. [`docs/experience.md`](/Users/iansh/Desktop/Devops-experience/devops-case-study/docs/experience.md)
6. [`docs/operating-model.md`](/Users/iansh/Desktop/Devops-experience/devops-case-study/docs/operating-model.md)
7. [`docs/public-safety.md`](/Users/iansh/Desktop/Devops-experience/devops-case-study/docs/public-safety.md)

## Quick Start

To inspect the sample Terraform composition:

```bash
cd examples/platform-core
terraform init
terraform plan -var-file=terraform.tfvars.example
```

This example is intentionally minimal and should be treated as a learning and portfolio scaffold, not a production-ready deployment.

## Future Additions

- reference diagrams for management group and subscription layout
- additional CI/CD workflow examples
- more sample infrastructure-as-code modules
- example governance controls and policy categories
- platform onboarding checklist for new workloads
- sanitized service-level modules for representative Azure workloads

## Disclaimer

This repository is an open-source learning and portfolio project inspired by real-world experience, but rewritten for public sharing. All sensitive details have been generalized or omitted.
