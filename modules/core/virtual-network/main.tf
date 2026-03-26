resource "azurerm_virtual_network" "this" {
  name                = local.resource_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = module.tag_outputs.tags

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan_id == null ? [] : [var.ddos_protection_plan_id]

    content {
      id     = ddos_protection_plan.value
      enable = var.enable_ddos_protection
    }
  }
}

resource "azurerm_virtual_network_peering" "local_to_remote" {
  name                      = format("%s-peer-%s-%s-%s-%s-local", var.name_prefix, var.topology, var.environment, local.location_short, var.suffix)
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.this.name
  remote_virtual_network_id = var.remote_virtual_network_id

  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  allow_gateway_transit        = var.allow_gateway_transit
  use_remote_gateways          = var.use_remote_gateways
}

resource "azurerm_virtual_network_peering" "remote_to_local" {
  name                      = format("%s-peer-%s-%s-%s-%s-remote", var.name_prefix, var.topology, var.environment, local.location_short, var.suffix)
  resource_group_name       = var.remote_resource_group_name
  virtual_network_name      = var.remote_virtual_network_name
  remote_virtual_network_id = azurerm_virtual_network.this.id

  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  allow_gateway_transit        = false
  use_remote_gateways          = false
}
