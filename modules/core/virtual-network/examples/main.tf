module "virtual_network" {
  source  = "app.terraform.io/example-org/virtual-network/azurerm"
  version = "x.x.x"

  resource_group_name = var.name
  topology            = var.topology
  environment         = var.environment
  location            = var.location
  address_space       = ["#.#.#.#/#"]

  remote_virtual_network_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/ser-rg-hybrid-dev-ncu-01/providers/Microsoft.Network/virtualNetworks/ser-vnet-hybrid-dev-ncu-01"
  remote_virtual_network_name = "ser-vnet-hybrid-dev-ncu-01"
  remote_resource_group_name  = "ser-rg-hybrid-dev-ncu-01"
}
