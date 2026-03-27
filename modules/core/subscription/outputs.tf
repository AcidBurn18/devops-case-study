output "id" {
  description = "Subscription resource ID."
  value       = data.azurerm_subscription.this.id
}

output "subscription_id" {
  description = "Subscription GUID."
  value       = data.azurerm_subscription.this.subscription_id
}

output "display_name" {
  description = "Subscription display name."
  value       = data.azurerm_subscription.this.display_name
}

output "tenant_id" {
  description = "Tenant ID that owns the subscription."
  value       = data.azurerm_subscription.this.tenant_id
}

output "management_group_association_id" {
  description = "Management group association ID when the subscription is attached to a management group."
  value       = try(azurerm_management_group_subscription_association.this[0].id, null)
}
