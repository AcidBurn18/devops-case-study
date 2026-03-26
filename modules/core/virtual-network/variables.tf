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
  description = "(Required) Resource group name where the virtual network will be created."
  type        = string
  nullable    = false

  validation {
    condition     = length(trim(var.resource_group_name)) > 0
    error_message = "resource_group_name must not be empty."
  }
}

variable "location" {
  description = "(Optional) Azure region for the virtual network."
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

variable "address_space" {
  description = "(Required) Address space assigned to the virtual network."
  type        = list(string)
  nullable    = false

  validation {
    condition     = length(var.address_space) > 0
    error_message = "address_space must contain at least one CIDR block."
  }
}

variable "common_tags" {
  description = "(Required) Common tags merged into the final virtual network tags."
  type        = map(string)
  nullable    = false
}

variable "custom_tags" {
  description = "(Optional) Custom tags merged on top of the common tags."
  type        = map(string)
  default     = {}
  nullable    = false
}

variable "remote_virtual_network_id" {
  description = "(Required) Remote virtual network ID used to create peering."
  type        = string
  nullable    = false

  validation {
    condition     = length(trim(var.remote_virtual_network_id)) > 0
    error_message = "remote_virtual_network_id must not be empty."
  }
}

variable "remote_virtual_network_name" {
  description = "(Required) Remote virtual network name used for reverse peering."
  type        = string
  nullable    = false

  validation {
    condition     = length(trim(var.remote_virtual_network_name)) > 0
    error_message = "remote_virtual_network_name must not be empty."
  }
}

variable "remote_resource_group_name" {
  description = "(Required) Remote resource group name used for reverse peering."
  type        = string
  nullable    = false

  validation {
    condition     = length(trim(var.remote_resource_group_name)) > 0
    error_message = "remote_resource_group_name must not be empty."
  }
}

variable "allow_virtual_network_access" {
  description = "(Optional) Whether peered virtual networks can access each other."
  type        = bool
  default     = true
  nullable    = false
}

variable "allow_forwarded_traffic" {
  description = "(Optional) Whether forwarded traffic is allowed through the peering."
  type        = bool
  default     = true
  nullable    = false
}

variable "allow_gateway_transit" {
  description = "(Optional) Whether gateway transit is allowed from the local virtual network."
  type        = bool
  default     = false
  nullable    = false
}

variable "use_remote_gateways" {
  description = "(Optional) Whether the local virtual network uses remote gateways."
  type        = bool
  default     = false
  nullable    = false
}

variable "ddos_protection_plan_id" {
  description = "(Optional) DDoS protection plan ID associated with the virtual network."
  type        = string
  default     = null
}

variable "enable_ddos_protection" {
  description = "(Optional) Whether DDoS protection is enabled when a plan ID is supplied."
  type        = bool
  default     = true
  nullable    = false
}
