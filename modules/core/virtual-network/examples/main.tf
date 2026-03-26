module "virtual_network" {
  source  = "app.terraform.io/example-org/virtual-network/azurerm"
  version = "x.x.x"

  name_prefix         = "ser"
  resource_group_name = "ser-rg-internal-dev-scu-01"
  topology            = var.topology
  environment         = var.environment
  location            = "southcentralus"
  suffix              = "01"
  address_space       = ["10.10.0.0/16"]
  tags = {
    application = "landing-zone"
    owner       = "platform-team"
  }

  remote_virtual_network_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/ser-rg-hybrid-dev-ncu-01/providers/Microsoft.Network/virtualNetworks/ser-vnet-hybrid-dev-ncu-01"
  remote_virtual_network_name = "ser-vnet-hybrid-dev-ncu-01"
  remote_resource_group_name  = "ser-rg-hybrid-dev-ncu-01"
}
