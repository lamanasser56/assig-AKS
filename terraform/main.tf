# Random suffix 
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}


# AKS Cluster existing
data "azurerm_kubernetes_cluster" "existing" {
  name                = var.existing_aks_name
  resource_group_name = var.existing_aks_resource_group
}

# VNet in (Node Resource Group)
data "azurerm_virtual_network" "existing" {
  name                = var.existing_vnet_name
  resource_group_name = var.existing_vnet_resource_group
}

# Resource Group for AKS
data "azurerm_resource_group" "existing" {
  name = var.existing_aks_resource_group
}


# Subnet new ---- Private Endpoint
resource "azurerm_subnet" "private_endpoint" {
  name                 = "${var.prefix}-pe-subnet"
  resource_group_name  = var.existing_vnet_resource_group # Node RG
  virtual_network_name = data.azurerm_virtual_network.existing.name
  address_prefixes     = [var.pe_subnet_address_prefix]
}


# Module: Container Registry (ACR)

module "acr" {
  source = "./modules/acr"

  acr_name            = "${var.prefix}acr${random_string.suffix.result}"
  resource_group_name = data.azurerm_resource_group.existing.name
  location            = data.azurerm_resource_group.existing.location
  acr_sku             = var.acr_sku
  admin_enabled       = true
  tags                = var.tags
}

# Link ACR with the existing AKS
resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id                     = data.azurerm_kubernetes_cluster.existing.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = module.acr.acr_id
  skip_service_principal_aad_check = true
}

# Module: Azure SQL Database

module "sql" {
  source = "./modules/sql"

  sql_server_name               = "${var.prefix}-sqlserver-${random_string.suffix.result}"
  resource_group_name           = data.azurerm_resource_group.existing.name
  location                      = data.azurerm_resource_group.existing.location
  sql_server_version            = "12.0"
  admin_login                   = var.sql_admin_login
  admin_password                = var.sql_admin_password
  public_network_access_enabled = false
  database_name                 = "${var.prefix}-sqldb"
  sku_name                      = var.sql_db_sku
  max_size_gb                   = 2
  zone_redundant                = false
  tags                          = var.tags
}

# Module: Private Link (SQL Private Endpoint)

module "privatelink" {
  source = "./modules/privatelink"

  private_endpoint_name           = "${var.prefix}-sql-pe"
  location                        = data.azurerm_resource_group.existing.location
  resource_group_name             = data.azurerm_resource_group.existing.name
  subnet_id                       = azurerm_subnet.private_endpoint.id
  private_service_connection_name = "${var.prefix}-sql-psc"
  resource_id                     = module.sql.sql_server_id
  subresource_names               = ["sqlServer"]
  private_dns_zone_name           = "privatelink.database.windows.net"
  dns_vnet_link_name              = "${var.prefix}-sql-dns-link"
  vnet_id                         = data.azurerm_virtual_network.existing.id
  dns_record_name                 = module.sql.sql_server_name
  tags                            = var.tags

  depends_on = [module.sql, azurerm_subnet.private_endpoint]
}

# Public IP for Ingress Controller

resource "azurerm_public_ip" "ingress" {
  name                = "${var.prefix}-ingress-ip"
  resource_group_name = data.azurerm_kubernetes_cluster.existing.node_resource_group
  location            = data.azurerm_resource_group.existing.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

