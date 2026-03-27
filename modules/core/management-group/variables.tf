variable "name_prefix" {
  description = "(Optional) Prefix used in the generated management group name."
  type        = string
  default     = "platform"
  nullable    = false

  validation {
    condition     = can(regex("^[a-z0-9-]{2,20}$", var.name_prefix))
    error_message = "name_prefix must be 2 to 20 characters and contain only lowercase letters, numbers, and hyphens."
  }
}

variable "display_name" {
  description = "(Optional) Friendly display name for the management group. When omitted, a display name is generated from topology and environment."
  type        = string
  default     = null

  validation {
    condition     = var.display_name == null || length(trim(var.display_name)) > 0
    error_message = "display_name must be null or a non-empty string."
  }
}

variable "parent_management_group_id" {
  description = "(Optional) Parent management group ID used to nest this management group in the landing zone hierarchy."
  type        = string
  default     = null

  validation {
    condition     = var.parent_management_group_id == null || length(trim(var.parent_management_group_id)) > 0
    error_message = "parent_management_group_id must be null or a non-empty string."
  }
}
