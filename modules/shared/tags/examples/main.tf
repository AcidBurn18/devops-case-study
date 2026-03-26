module "tags" {
  source  = "app.terraform.io/example-org/tags/local"
  version = "x.x.x"

  topology    = var.topology
  environment = var.environment
  common_tags = {
    project     = "azure-landing-zone-starter"
    managed_by  = "terraform"
    environment = var.environment
    topology    = var.topology
  }
  custom_tags = {
    owner = "platform-team"
  }
}
