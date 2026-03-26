output "id" {
  description = "Subnet ID."
  value       = azurerm_subnet.this.id
}

output "name" {
  description = "Subnet name."
  value       = azurerm_subnet.this.name
}

output "network_security_group_id" {
  description = "Subnet NSG ID."
  value       = azurerm_network_security_group.this.id
}

output "route_table_id" {
  description = "Subnet route table ID."
  value       = azurerm_route_table.this.id
}
