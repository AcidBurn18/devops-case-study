variable "subscription_name" {
  description = "(Required) Subscription display name. This is used for new subscription creation and for documentation of existing subscriptions."
  type        = string
  nullable    = false

  validation {
    condition     = length(trim(var.subscription_name)) > 0
    error_message = "subscription_name must not be empty."
  }
}

variable "subscription_id" {
  description = "(Optional) Existing Azure subscription GUID. When provided, the module manages placement and metadata for the existing subscription instead of creating a new one."
  type        = string
  default     = null

  validation {
    condition = (
      var.subscription_id == null ||
      can(regex("^[0-9a-fA-F-]{36}$", var.subscription_id))
    )
    error_message = "subscription_id must be null or a valid Azure subscription GUID."
  }
}

variable "billing_scope_id" {
  description = "(Optional) Billing scope used when creating a new subscription alias."
  type        = string
  default     = null

  validation {
    condition     = var.billing_scope_id == null || length(trim(var.billing_scope_id)) > 0
    error_message = "billing_scope_id must be null or a non-empty string."
  }
}

variable "alias" {
  description = "(Optional) Subscription alias. When omitted, a stable alias is generated from the module context."
  type        = string
  default     = null

  validation {
    condition     = var.alias == null || length(trim(var.alias)) > 0
    error_message = "alias must be null or a non-empty string."
  }
}

variable "management_group_id" {
  description = "(Optional) Management group ID used to associate the subscription to the landing zone hierarchy."
  type        = string
  default     = null

  validation {
    condition     = var.management_group_id == null || length(trim(var.management_group_id)) > 0
    error_message = "management_group_id must be null or a non-empty string."
  }
}

variable "workload" {
  description = "(Optional) Subscription workload classification used when creating a new subscription."
  type        = string
  default     = "Production"
  nullable    = false

  validation {
    condition     = contains(["Production", "DevTest"], var.workload)
    error_message = "workload must be one of: Production, DevTest."
  }
}

variable "tags" {
  description = "(Optional) Tags applied when the module creates a new subscription."
  type        = map(string)
  default     = {}
  nullable    = false
}
