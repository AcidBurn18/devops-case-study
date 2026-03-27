resource "azurerm_management_group" "this" {
  name                       = local.management_group_name
  display_name               = local.management_group_display_name
  parent_management_group_id = var.parent_management_group_id
}
