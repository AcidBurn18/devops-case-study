variable "name_prefix" {
  description = "(Optional) Prefix used in all generated resource names."
  type        = string
  default     = "ser"
  nullable    = false

  validation {
    condition     = can(regex("^[a-z0-9]{2,10}$", var.name_prefix))
    error_message = "name_prefix must be 2 to 10 lowercase alphanumeric characters."
  }
}

variable "location" {
  description = "(Optional) Azure region for the deployment."
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

variable "custom_tags" {
  description = "(Optional) Custom tags merged with the common platform tags."
  type        = map(string)
  default     = {}
  nullable    = false
}

variable "vnet_address_space" {
  description = "(Required) Address space assigned to the virtual network."
  type        = list(string)
  nullable    = false

  validation {
    condition     = length(var.vnet_address_space) > 0
    error_message = "vnet_address_space must contain at least one CIDR block."
  }
}

variable "app_subnet_address_prefixes" {
  description = "(Required) Address prefixes assigned to the application subnet."
  type        = list(string)
  nullable    = false

  validation {
    condition     = length(var.app_subnet_address_prefixes) > 0
    error_message = "app_subnet_address_prefixes must contain at least one CIDR block."
  }
}

variable "data_subnet_address_prefixes" {
  description = "(Required) Address prefixes assigned to the data subnet."
  type        = list(string)
  nullable    = false

  validation {
    condition     = length(var.data_subnet_address_prefixes) > 0
    error_message = "data_subnet_address_prefixes must contain at least one CIDR block."
  }
}

variable "app_subnet_service_endpoints" {
  description = "(Optional) Azure service endpoints enabled on the application subnet."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "data_subnet_service_endpoints" {
  description = "(Optional) Azure service endpoints enabled on the data subnet."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "common_nsg_rules" {
  description = "(Optional) Common NSG rules applied to all subnet module calls."
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

variable "app_custom_nsg_rules" {
  description = "(Optional) Custom NSG rules applied only to the application subnet."
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

variable "data_custom_nsg_rules" {
  description = "(Optional) Custom NSG rules applied only to the data subnet."
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
  description = "(Optional) Common user-defined routes applied to all subnet module calls."
  type = list(object({
    suffix                 = optional(string)
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
  default  = []
  nullable = false
}

variable "app_custom_udr_routes" {
  description = "(Optional) Custom user-defined routes applied only to the application subnet."
  type = list(object({
    suffix                 = optional(string)
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
  default  = []
  nullable = false
}

variable "data_custom_udr_routes" {
  description = "(Optional) Custom user-defined routes applied only to the data subnet."
  type = list(object({
    suffix                 = optional(string)
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
  default  = []
  nullable = false
}

variable "remote_virtual_network_id" {
  description = "(Optional) Remote virtual network ID used to create peering from the local virtual network."
  type        = string
  default     = null
}

variable "remote_virtual_network_name" {
  description = "(Optional) Remote virtual network name used to create reverse peering."
  type        = string
  default     = null
}

variable "remote_resource_group_name" {
  description = "(Optional) Remote resource group name used to create reverse peering."
  type        = string
  default     = null
}
