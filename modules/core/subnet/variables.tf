variable "name_prefix" {
  description = "(Optional) Prefix used in generated resource names."
  type        = string
  default     = "ser"
  nullable    = false

  validation {
    condition     = can(regex("^[a-z0-9]{2,10}$", var.name_prefix))
    error_message = "name_prefix must be 2 to 10 lowercase alphanumeric characters."
  }
}

variable "resource_group_name" {
  description = "(Required) Resource group name containing the subnet resources."
  type        = string
  nullable    = false

  validation {
    condition     = length(trim(var.resource_group_name)) > 0
    error_message = "resource_group_name must not be empty."
  }
}

variable "virtual_network_name" {
  description = "(Required) Virtual network name where the subnet will be created."
  type        = string
  nullable    = false

  validation {
    condition     = length(trim(var.virtual_network_name)) > 0
    error_message = "virtual_network_name must not be empty."
  }
}

variable "location" {
  description = "(Optional) Azure region for the subnet resources."
  type        = string
  default     = "southcentralus"
  nullable    = false

  validation {
    condition     = contains(["southcentralus", "northcentralus"], var.location)
    error_message = "location must be one of: southcentralus, northcentralus."
  }
}

variable "suffix" {
  description = "(Optional) Two-digit suffix appended to generated resource names."
  type        = string
  default     = "01"
  nullable    = false

  validation {
    condition     = can(regex("^[0-9]{2}$", var.suffix))
    error_message = "suffix must be a two-digit string such as 01 or 02."
  }
}

variable "address_prefixes" {
  description = "(Required) Address prefixes assigned to the subnet."
  type        = list(string)
  nullable    = false

  validation {
    condition     = length(var.address_prefixes) > 0
    error_message = "address_prefixes must contain at least one CIDR block."
  }
}

variable "service_endpoints" {
  description = "(Optional) Azure service endpoints enabled on the subnet."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "common_nsg_rules" {
  description = "(Optional) Common NSG rules merged with custom subnet rules."
  type = list(object({
    suffix                     = optional(string)
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default  = []
  nullable = false
}

variable "custom_nsg_rules" {
  description = "(Optional) Custom NSG rules merged with the common subnet rules."
  type = list(object({
    suffix                     = optional(string)
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default  = []
  nullable = false
}

variable "common_udr_routes" {
  description = "(Optional) Common user-defined routes merged with custom subnet routes."
  type = list(object({
    suffix                 = optional(string)
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
  default  = []
  nullable = false
}

variable "custom_udr_routes" {
  description = "(Optional) Custom user-defined routes merged with the common subnet routes."
  type = list(object({
    suffix                 = optional(string)
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
  default  = []
  nullable = false
}

variable "tags" {
  description = "(Optional) Tags applied to NSG and route table resources created by this module."
  type        = map(string)
  default     = {}
  nullable    = false
}
