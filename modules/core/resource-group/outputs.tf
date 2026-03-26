output "id" {
  description = "Resource group ID."
  value       = azurerm_resource_group.this.id
}

output "name" {
  description = "Resource group name."
  value       = azurerm_resource_group.this.name
}

output "location_short" {
  description = "Short code derived from the selected location."
  value       = local.location_short
}
