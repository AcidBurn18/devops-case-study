output "id" {
  description = "NSG rule ID."
  value       = azurerm_network_security_rule.this.id
}

output "name" {
  description = "NSG rule name."
  value       = azurerm_network_security_rule.this.name
}
