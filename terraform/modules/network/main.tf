resource "azurerm_virtual_network" "Vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet" "aks" {
  name                 = var.aks_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.Vnet.name
  address_prefixes     = [var.aks_subnet_address_prefix]
}

resource "azurerm_subnet" "private_endpoint" {
  name                 = var.pe_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.Vnet.name
  address_prefixes     = [var.pe_subnet_address_prefix]
}