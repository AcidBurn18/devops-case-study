module "subscription" {
  source  = "app.terraform.io/example-org/subscription/azurerm"
  version = "x.x.x"

  topology            = var.topology
  environment         = var.environment
  subscription_name   = "platform-dev-subscription"
  subscription_id     = var.subscription_id
  billing_scope_id    = var.billing_scope_id
  management_group_id = var.management_group_id
  workload            = "DevTest"
  tags = {
    owner       = "platform-team"
    cost_center = "shared-platform"
  }
}
