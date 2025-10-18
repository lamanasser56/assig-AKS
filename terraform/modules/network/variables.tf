variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}

variable "vnet_address_space" {
  description = "CIDR"
  type        = list(string)
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "aks_subnet_name" {
  description = "AKS Subnet"
  type        = string
}

variable "aks_subnet_address_prefix" {
  description = "CIDR for the AKS Subnet"
  type        = string
}

variable "pe_subnet_name" {
  description = "Private Endpoint Subnet"
  type        = string
}

variable "pe_subnet_address_prefix" {
  description = "CIDR for the Private Endpoint Subnet"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}