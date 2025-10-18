output "sql_server_id" {
  description = "معرف SQL Server"
  value       = azurerm_mssql_server.sql_server.id
}

output "sql_server_name" {
  description = "اسم SQL Server"
  value       = azurerm_mssql_server.sql_server.name
}

output "sql_server_fqdn" {
  description = "FQDN للـ SQL Server"
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "database_id" {
  description = "معرف قاعدة البيانات"
  value       = azurerm_mssql_database.mssqlbd.id
}

output "database_name" {
  description = "اسم قاعدة البيانات"
  value       = azurerm_mssql_database.mssqlbd.name
}