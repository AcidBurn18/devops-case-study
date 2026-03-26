variable "name_prefix" {
  description = "(Optional) Prefix used in the generated resource name."
  type        = string
  default     = "ser"
  nullable    = false

  validation {
    condition     = can(regex("^[a-z0-9]{2,10}$", var.name_prefix))
    error_message = "name_prefix must be 2 to 10 lowercase alphanumeric characters."
  }
}

variable "location" {
  description = "(Optional) Azure region for the resource group."
  type        = string
  default     = "southcentralus"
  nullable    = false

  validation {
    condition     = contains(["southcentralus", "northcentralus"], var.location)
    error_message = "location must be one of: southcentralus, northcentralus."
  }
}

variable "suffix" {
  description = "(Optional) Two-digit suffix appended to the generated resource name."
  type        = string
  default     = "01"
  nullable    = false

  validation {
    condition     = can(regex("^[0-9]{2}$", var.suffix))
    error_message = "suffix must be a two-digit string such as 01 or 02."
  }
}

variable "tags" {
  description = "(Optional) Tags applied to the resource group."
  type        = map(string)
  default     = {}
  nullable    = false
}
