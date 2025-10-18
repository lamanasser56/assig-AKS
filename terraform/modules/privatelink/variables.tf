variable "private_endpoint_name" {
  description = "Private Endpoint name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the Private Endpoint"
  type        = string
}

variable "private_service_connection_name" {
  description = "Private Service Connection name"
  type        = string
}

variable "resource_id" {
  description = "Target resource ID"
  type        = string
}

variable "subresource_names" {
  description = "Subresource names"
  type        = list(string)
}

variable "private_dns_zone_name" {
  description = "Private DNS Zone name"
  type        = string
}

variable "dns_vnet_link_name" {
  description = "DNS VNet Link name"
  type        = string
}

variable "vnet_id" {
  description = "Virtual Network ID"
  type        = string
}

variable "dns_record_name" {
  description = "DNS A record name"
  type        = string
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
