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

variable "resource_group_name" {
  description = "(Required) Resource group name containing the target NSG."
  type        = string
  nullable    = false

  validation {
    condition     = length(trim(var.resource_group_name)) > 0
    error_message = "resource_group_name must not be empty."
  }
}

variable "network_security_group_name" {
  description = "(Required) Target NSG name for the rule."
  type        = string
  nullable    = false

  validation {
    condition     = length(trim(var.network_security_group_name)) > 0
    error_message = "network_security_group_name must not be empty."
  }
}

variable "location" {
  description = "(Optional) Azure region for naming standardization."
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

variable "priority" {
  description = "(Required) Priority of the NSG rule."
  type        = number
  nullable    = false

  validation {
    condition     = var.priority >= 100 && var.priority <= 4096
    error_message = "priority must be between 100 and 4096."
  }
}

variable "direction" {
  description = "(Required) Traffic direction for the rule."
  type        = string
  nullable    = false

  validation {
    condition     = contains(["Inbound", "Outbound"], var.direction)
    error_message = "direction must be Inbound or Outbound."
  }
}

variable "access" {
  description = "(Required) Access action for the rule."
  type        = string
  nullable    = false

  validation {
    condition     = contains(["Allow", "Deny"], var.access)
    error_message = "access must be Allow or Deny."
  }
}

variable "protocol" {
  description = "(Required) Protocol for the rule."
  type        = string
  nullable    = false

  validation {
    condition     = contains(["Tcp", "Udp", "Icmp", "*", "Ah", "Esp"], var.protocol)
    error_message = "protocol must be one of: Tcp, Udp, Icmp, Ah, Esp, *."
  }
}

variable "source_port_range" {
  description = "(Required) Source port range for the rule."
  type        = string
  nullable    = false
}

variable "destination_port_range" {
  description = "(Required) Destination port range for the rule."
  type        = string
  nullable    = false
}

variable "source_address_prefix" {
  description = "(Required) Source address prefix for the rule."
  type        = string
  nullable    = false
}

variable "destination_address_prefix" {
  description = "(Required) Destination address prefix for the rule."
  type        = string
  nullable    = false
}
