output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = azurerm_resource_group.rg_lama_assig.name
}

output "resource_group_id" {
  description = "ID of the Resource Group"
  value       = azurerm_resource_group.rg_lama_assig.id
}

output "location" {
  description = "Region of the Resource Group"
  value       = azurerm_resource_group.rg_lama_assig.location
}