variable "topology" {
  description = "(Required) Workspace-provided topology category for the resource."
  type        = string
  nullable    = false

  validation {
    condition     = contains(["internal", "hybrid", "external"], var.topology)
    error_message = "topology must be one of: internal, hybrid, external."
  }
}

variable "env" {
  description = "(Required) Workspace-provided environment for the resource."
  type        = string
  nullable    = false

  validation {
    condition     = contains(["dev", "test", "stage", "prod"], var.env)
    error_message = "env must be one of: dev, test, stage, prod."
  }
}
