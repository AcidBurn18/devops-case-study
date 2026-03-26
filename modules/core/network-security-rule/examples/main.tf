module "network_security_rule" {
  source  = "app.terraform.io/example-org/network-security-rule/azurerm"
  version = "x.x.x"

  name_prefix                 = "ser"
  resource_group_name         = "ser-rg-internal-dev-scu-01"
  network_security_group_name = "ser-nsg-internal-dev-scu-01"
  topology                    = var.topology
  environment                 = var.environment
  location                    = "southcentralus"
  suffix                      = "01"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}
