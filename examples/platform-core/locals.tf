locals {
  common_tags = {
    project        = "azure-landing-zone-starter"
    environment    = var.environment
    topology       = var.topology
    managed_by     = "terraform"
    deployment_set = var.suffix
    tenant_id      = data.azurerm_client_config.current.tenant_id
  }
}
