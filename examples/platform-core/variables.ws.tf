variable "topology" {
  description = "(Required) Workspace-provided topology category for the deployment."
  type        = string
  nullable    = false

  validation {
    condition     = contains(["internal", "hybrid", "external"], var.topology)
    error_message = "topology must be one of: internal, hybrid, external."
  }
}

variable "environment" {
  description = "(Required) Workspace-provided environment name for the deployment."
  type        = string
  nullable    = false

  validation {
    condition     = contains(["dev", "test", "stage", "prod"], var.environment)
    error_message = "environment must be one of: dev, test, stage, prod."
  }
}
