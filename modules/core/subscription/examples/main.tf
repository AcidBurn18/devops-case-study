module "subscription" {
  source  = "app.terraform.io/example-org/subscription/azurerm"
  version = "x.x.x"

  topology    = var.topology
  environment = var.environment
}
