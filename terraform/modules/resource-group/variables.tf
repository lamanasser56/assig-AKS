variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "region for the resource group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
}