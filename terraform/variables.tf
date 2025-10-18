# Terraform Variables - For Existing AKS

# Existing AKS Configuration

variable "existing_aks_name" {
  description = "Existing AKS cluster name"
  type        = string

}

variable "existing_aks_resource_group" {
  description = "Resource group of the existing AKS cluster"
  type        = string

}

variable "existing_vnet_name" {
  description = "Existing Virtual Network name"
  type        = string

}

variable "existing_vnet_resource_group" {
  description = "Resource group of the existing VNet (usually Node RG)"
  type        = string

}

variable "pe_subnet_address_prefix" {
  description = "CIDR block for the new Private Endpoint subnet"
  type        = string
  default     = "10.240.0.0/24"

}

# General Settings

variable "prefix" {
  description = "Short prefix for new resources"
  type        = string
  default     = "ecommerce"

}

# ACR Configuration

variable "acr_sku" {
  description = "Azure Container Registry SKU"
  type        = string
  default     = "Standard"

}

# Azure SQL Database Configuration

variable "sql_admin_login" {
  description = "SQL Server admin username"
  type        = string
  sensitive   = true

}

variable "sql_admin_password" {
  description = "SQL Server admin password"
  type        = string
  sensitive   = true

}

variable "sql_db_sku" {
  description = "SQL Database SKU"
  type        = string
  default     = "S0"

}

# Application Settings

variable "jwt_secret" {
  description = "JWT secret key for the application"
  type        = string
  sensitive   = true
  default     = "change-this-to-random-long-secret-key"

}

variable "cors_origin" {
  description = "Allowed CORS origin (to be updated after getting Ingress IP)"
  type        = string
  default     = "*"
}

# Tags

variable "tags" {
  description = "Tags for Azure resources"
  type        = map(string)
  default = {
    Project     = "Ecommerce-3Tier"
    ManagedBy   = "Terraform"
    Environment = "Development"
  }
}
