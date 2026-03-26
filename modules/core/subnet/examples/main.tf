module "subnet" {
  source  = "app.terraform.io/example-org/subnet/azurerm"
  version = "x.x.x"

  name_prefix          = "ser"
  resource_group_name  = "ser-rg-internal-dev-scu-01"
  virtual_network_name = "ser-vnet-internal-dev-scu-01"
  topology             = var.topology
  environment          = var.environment
  location             = "southcentralus"
  suffix               = "01"
  address_prefixes     = ["10.10.1.0/24"]
  service_endpoints    = ["Microsoft.Storage"]

  common_nsg_rules = [
    {
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]

  custom_nsg_rules = []

  common_udr_routes = [
    {
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "Internet"
    }
  ]

  custom_udr_routes = []

  tags = {
    application = "landing-zone"
    owner       = "platform-team"
  }
}
