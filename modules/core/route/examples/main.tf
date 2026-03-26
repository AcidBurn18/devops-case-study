module "route" {
  source  = "app.terraform.io/example-org/route/azurerm"
  version = "x.x.x"

  name_prefix         = "ser"
  resource_group_name = "ser-rg-internal-dev-scu-01"
  route_table_name    = "ser-udr-internal-dev-scu-01"
  topology            = var.topology
  environment         = var.environment
  location            = "southcentralus"
  suffix              = "01"
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"
}
