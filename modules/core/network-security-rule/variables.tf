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
variable "common_nsg_rules" {
  description = "(Required) List of common NSG rules."
  type = map(object({
    priority                     = number
    direction                    = string
    access                       = string
    protocol                     = string
    source_port_range            = string
    source_port_ranges           = list(string)
    destination_port_range       = string
    destination_port_ranges      = list(string)
    source_address_prefix        = string
    source_address_prefixes      = list(string)
    destination_address_prefix   = string
    destination_address_prefixes = list(string)
  }))
  default = {}
}
variable "custom_nsg_rules" {
  description = "(Optional) List of custom NSG rules."
  type = map(object({
    priority                     = number
    direction                    = string
    access                       = string
    protocol                     = string
    source_port_range            = string
    source_port_ranges           = list(string)
    destination_port_range       = string
    destination_port_ranges      = list(string)
    source_address_prefix        = string
    source_address_prefixes      = list(string)
    destination_address_prefix   = string
    destination_address_prefixes = list(string)
  }))
  default = {}
}