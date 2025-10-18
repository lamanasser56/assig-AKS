variable "sql_server_name" {
  description = "SQL Server name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "sql_server_version" {
  description = "SQL Server version"
  type        = string
  default     = "12.0"
}

variable "admin_login" {
  description = "Admin username "
  type        = string
  sensitive   = true
}

variable "admin_password" {
  description = "Admin Password"
  type        = string
  sensitive   = true
}

variable "public_network_access_enabled" {
  description = "Allow public network access (should be false for security)"
  type        = bool
  default     = false
}

variable "database_name" {
  description = ""
  type        = string
}

variable "collation" {
  description = "Collation BD"
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "sku_name" {
  description = "SKU  (S0, S1, P1, ..)"
  type        = string
  default     = "S0"
}

variable "max_size_gb" {
  description = ""
  type        = number
  default     = 2
}

variable "zone_redundant" {
  description = "Zone Redundancy"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}