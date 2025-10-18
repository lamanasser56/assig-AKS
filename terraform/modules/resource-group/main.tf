resource "azurerm_resource_group" "rg_lama_assig" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}