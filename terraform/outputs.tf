# Existing AKS Information

output "aks_cluster_name" {
  description = "AKS Cluster name (existing)"
  value       = data.azurerm_kubernetes_cluster.existing.name
}

output "aks_resource_group" {
  description = "Resource Group for AKS"
  value       = data.azurerm_kubernetes_cluster.existing.resource_group_name
}

output "aks_node_resource_group" {
  description = "Node Resource Group"
  value       = data.azurerm_kubernetes_cluster.existing.node_resource_group
}

output "aks_location" {
  description = "AKS Location"
  value       = data.azurerm_kubernetes_cluster.existing.location
}

# VNet Information

output "vnet_name" {
  description = "VNet existing"
  value       = data.azurerm_virtual_network.existing.name
}

output "vnet_id" {
  description = "ID VNet"
  value       = data.azurerm_virtual_network.existing.id
}

output "pe_subnet_id" {
  description = "ID Private Endpoint Subnet (new)"
  value       = azurerm_subnet.private_endpoint.id
}

# ACR (Container Registry)

output "acr_name" {
  description = "Container Registry"
  value       = module.acr.acr_login_server
}

output "acr_login_server" {
  description = "ACR Login"
  value       = module.acr.acr_login_server
}

output "acr_admin_username" {
  description = "ACR Admin username"
  value       = module.acr.acr_admin_username
  sensitive   = true
}

output "acr_admin_password" {
  description = "ACR Admin password"
  value       = module.acr.acr_admin_password
  sensitive   = true
}

# SQL Database

output "sql_server_name" {
  description = "SQL Server name"
  value       = module.sql.sql_server_name
}

output "sql_server_fqdn" {
  description = "FQDN---SQL Server (Private)"
  value       = module.sql.sql_server_fqdn
}

output "sql_database_name" {
  description = "Database name"
  value       = module.sql.database_name
}

output "sql_private_ip" {
  description = "SQL's private IP address"
  value       = module.privatelink.private_ip_address
}

# Ingress

output "ingress_public_ip" {
  description = "The public IP address of the Ingress"
  value       = azurerm_public_ip.ingress.ip_address
}

output "ingress_public_ip_id" {
  description = "Public IP"
  value       = azurerm_public_ip.ingress.id
}

# Connection Info (K8s)

output "connection_info" {
  description = "Full contact information"
  value = {
    # AKS
    aks_name = data.azurerm_kubernetes_cluster.existing.name
    aks_rg   = data.azurerm_kubernetes_cluster.existing.resource_group_name
    node_rg  = data.azurerm_kubernetes_cluster.existing.node_resource_group
    location = data.azurerm_kubernetes_cluster.existing.location

    # ACR
    acr_server = module.acr.acr_login_server

    # Database
    db_server     = module.sql.sql_server_fqdn
    db_name       = module.sql.database_name
    db_private_ip = module.privatelink.private_ip_address

    # Ingress
    ingress_ip = azurerm_public_ip.ingress.ip_address
  }
}

# GitHub Actions Variables

output "github_actions_vars" {
  description = "GitHub Actions"
  value = {
    AKS_NAME           = data.azurerm_kubernetes_cluster.existing.name
    AKS_RESOURCE_GROUP = data.azurerm_kubernetes_cluster.existing.resource_group_name
    ACR_LOGIN_SERVER   = module.acr.acr_login_server
    INGRESS_IP         = azurerm_public_ip.ingress.ip_address
    SQL_SERVER_FQDN    = module.sql.sql_server_fqdn
    SQL_DATABASE_NAME  = module.sql.database_name
  }
}

