resource "azurerm_subscription" "this" {
  count = var.subscription_id == null ? 1 : 0

  subscription_name = var.subscription_name
  alias             = local.subscription_alias
  billing_scope_id  = var.billing_scope_id
  workload          = var.workload
  tags              = var.tags

  lifecycle {
    precondition {
      condition     = var.billing_scope_id != null && length(trim(var.billing_scope_id)) > 0
      error_message = "billing_scope_id must be provided when creating a new subscription."
    }
  }
}

data "azurerm_subscription" "this" {
  subscription_id = local.effective_subscription_id

  depends_on = [azurerm_subscription.this]
}

resource "azurerm_management_group_subscription_association" "this" {
  count = var.management_group_id == null ? 0 : 1

  management_group_id = var.management_group_id
  subscription_id     = local.effective_subscription_resource_id
}
