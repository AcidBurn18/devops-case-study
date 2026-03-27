variable "subscription_id" {
  description = "(Optional) Existing subscription GUID for the example."
  type        = string
  default     = null
}

variable "billing_scope_id" {
  description = "(Optional) Billing scope used when the example creates a new subscription."
  type        = string
  default     = null
}

variable "management_group_id" {
  description = "(Optional) Management group ID used for the example association."
  type        = string
  default     = null
}
