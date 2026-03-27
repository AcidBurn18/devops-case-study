locals {
  subscription_alias = coalesce(
    var.alias,
    format(
      "sub-%s-%s-%s",
      var.topology,
      var.environment,
      regexreplace(lower(var.subscription_name), "[^a-z0-9-]", "-")
    )
  )

  effective_subscription_id = var.subscription_id != null ? var.subscription_id : azurerm_subscription.this[0].subscription_id
  effective_subscription_resource_id = format("/subscriptions/%s", local.effective_subscription_id)
}
