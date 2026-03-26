module "management_group" {
  source  = "app.terraform.io/example-org/management-group/azurerm"
  version = "x.x.x"

  topology    = var.topology
  environment = var.environment
}
