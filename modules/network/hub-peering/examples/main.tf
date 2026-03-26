module "hub_peering" {
  source  = "app.terraform.io/example-org/hub-peering/azurerm"
  version = "x.x.x"

  topology    = var.topology
  environment = var.environment
}
