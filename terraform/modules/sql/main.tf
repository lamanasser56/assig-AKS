resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_server_version
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password

  public_network_access_enabled = var.public_network_access_enabled

  tags = var.tags
}

resource "azurerm_mssql_database" "mssqlbd" {
  name           = var.database_name
  server_id      = azurerm_mssql_server.sql_server.id
  collation      = var.collation
  sku_name       = var.sku_name
  max_size_gb    = var.max_size_gb
  zone_redundant = var.zone_redundant

  tags = var.tags
}