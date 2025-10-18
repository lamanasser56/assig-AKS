output "vnet_id" {
  description = " ID Virtual Network"
  value       = azurerm_virtual_network.Vnet.id
}

output "vnet_name" {
  description = "Virtual Network name"
  value       = azurerm_virtual_network.Vnet.name
}

output "aks_subnet_id" {
  description = "ID AKS Subnet"
  value       = azurerm_subnet.aks.id
}

output "pe_subnet_id" {
  description = "ID Private Endpoint Subnet"
  value       = azurerm_subnet.private_endpoint.id
}