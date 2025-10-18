#Information about the existing AKS
existing_aks_name            = "devops2-lama-d-aks-aks-cluster"
existing_aks_resource_group  = "devops2-lama-d-aks-rg"
existing_vnet_name           = "aks-vnet-58963282"
existing_vnet_resource_group = "devops2-lama-d-aks-aks-node"

# Subnet for Private Endpoint
pe_subnet_address_prefix = "10.240.0.0/24"

# General
prefix = "lama"

# Database
sql_admin_login    = "sqladmin"
sql_admin_password = "Lamanasser22@"
sql_db_sku         = "S0"

# Application
jwt_secret  = "lama-jwt-secret-key-2025-random-32chars-min"
cors_origin = "*"

# ACR
acr_sku = "Standard"

# Tags
tags = {
  Project     = "Ecommerce-3Tier"
  ManagedBy   = "Terraform"
  Environment = "dev"
  Owner       = "Lama"
}
