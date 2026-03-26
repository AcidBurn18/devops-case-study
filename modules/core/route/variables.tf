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
  description = "(Required) Resource group name containing the route table."
  type        = string
  nullable    = false

  validation {
    condition     = length(trim(var.resource_group_name)) > 0
    error_message = "resource_group_name must not be empty."
  }
}

variable "route_table_name" {
  description = "(Required) Route table name where the route will be created."
  type        = string
  nullable    = false

  validation {
    condition     = length(trim(var.route_table_name)) > 0
    error_message = "route_table_name must not be empty."
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

variable "address_prefix" {
  description = "(Required) Address prefix matched by the route."
  type        = string
  nullable    = false
}

variable "next_hop_type" {
  description = "(Required) Next hop type used by the route."
  type        = string
  nullable    = false

  validation {
    condition = contains([
      "VirtualNetworkGateway",
      "VnetLocal",
      "Internet",
      "VirtualAppliance",
      "None",
    ], var.next_hop_type)
    error_message = "next_hop_type must be one of: VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance, None."
  }
}

variable "next_hop_in_ip_address" {
  description = "(Optional) IP address of the next hop when using VirtualAppliance."
  type        = string
  default     = null

  validation {
    condition     = var.next_hop_type != "VirtualAppliance" || var.next_hop_in_ip_address != null
    error_message = "next_hop_in_ip_address must be set when next_hop_type is VirtualAppliance."
  }
}
