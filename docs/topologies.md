# Topology Model

This document captures the generalized topology model behind the Landing Zone experience represented in this repository.

The real implementation used multiple connectivity patterns depending on workload traffic needs. This public version keeps the model high-level while still showing the platform thinking involved.

## Topology Categories

The platform supported multiple topology types based on application communication requirements:

- `internal`
- `hybrid`
- `external`

These topology types gave workload teams a controlled way to choose a network and exposure model that fit the application rather than treating all workloads the same.

## Internal Topology

The internal topology is intended for workloads that should remain private inside the enterprise or platform-controlled boundary.

Typical characteristics:

- no broad public exposure
- controlled east-west connectivity
- strong dependency on shared enterprise or platform services
- environment separation across dev, test, stage, and prod

## Hybrid Topology

The hybrid topology is intended for workloads that need both controlled internal connectivity and selective integration with external or shared systems.

Typical characteristics:

- connectivity to shared services or on-prem style integrations
- tighter routing and traffic control requirements
- more coordination between network and application teams
- environment consistency across the full delivery lifecycle

## External Topology

The external topology is intended for workloads that serve user-facing or partner-facing traffic.

Typical characteristics:

- stronger ingress design considerations
- more emphasis on edge controls and exposure boundaries
- application-specific security review
- standardized environment rollout across dev, test, stage, and prod

## Environment Model

Each topology pattern is assumed to support four standard environments:

- `dev`
- `test`
- `stage`
- `prod`

This creates a predictable delivery structure and keeps platform expectations clear for onboarding teams.

## Why This Matters

This topology model is one of the most important parts of the platform story because it shows that the Landing Zone was not only about provisioning Azure resources. It was also about creating a repeatable network and environment model that application teams could consume safely and consistently.
