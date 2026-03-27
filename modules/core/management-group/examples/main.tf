module "management_group" {
  source  = "app.terraform.io/example-org/management-group/azurerm"
  version = "x.x.x"

  name_prefix                = "platform"
  topology                   = var.topology
  environment                = var.environment
  display_name               = format("Platform %s", upper(var.environment))
  parent_management_group_id = var.parent_management_group_id
}
