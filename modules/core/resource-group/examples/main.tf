module "resource_group" {
  source  = "app.terraform.io/example-org/resource-group/azurerm"
  version = "x.x.x"

  name        = var.name
  location    = var.location
  topology    = var.topology
  env         = var.env
}
