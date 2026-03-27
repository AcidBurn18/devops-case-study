resource "azurerm_subnet" "this" {
  name                 = local.resource_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
  service_endpoints    = var.service_endpoints
}

resource "azurerm_network_security_group" "this" {
  name                = local.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_route_table" "this" {
  name                = local.udr_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}



resource "azurerm_subnet_network_security_group_association" "this" {
  subnet_id                 = azurerm_subnet.this.id
  network_security_group_id = azurerm_network_security_group.this.id
}

resource "azurerm_subnet_route_table_association" "this" {
  subnet_id      = azurerm_subnet.this.id
  route_table_id = azurerm_route_table.this.id
}

module "network-security-rule" {
  source  = "<PATH_TO_MODULE>"
  version = "x.x.x"


}

module "route" {
  source  = "<PATH_TO_MODULE>"
  version = "x.x.x"


}