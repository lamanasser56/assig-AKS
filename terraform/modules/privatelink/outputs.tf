output "private_endpoint_id" {
  description = "Private Endpoint resource ID"
  value       = azurerm_private_endpoint.pe_lama.id
}

output "private_ip_address" {
  description = "Private IP address assigned to the Private Endpoint"
  value       = azurerm_private_endpoint.pe_lama.private_service_connection[0].private_ip_address
}

output "private_dns_zone_id" {
  description = "Private DNS Zone resource ID"
  value       = azurerm_private_dns_zone.dns.id
}

output "private_dns_zone_name" {
  description = "Private DNS Zone name"
  value       = azurerm_private_dns_zone.dns.name
}
