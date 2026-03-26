resource "azurerm_resource_group" "this" {
  name     = local.resource_name
  location = var.location
  tags     = var.tags
}
