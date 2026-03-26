module "resource_group" {
  source  = "app.terraform.io/example-org/resource-group/azurerm"
  version = "x.x.x"

  name_prefix = "ser"
  topology    = var.topology
  environment = var.environment
  location    = "southcentralus"
  suffix      = "01"
  tags = {
    application = "landing-zone"
    owner       = "platform-team"
  }
}
