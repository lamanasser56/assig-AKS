/*
variable "aks_name" {
  description = "AKS Cluster name"
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

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.28"
}

variable "default_node_pool_name" {
  description = "Default node pool name"
  type        = string
  default     = "system"
}

variable "node_count" {
  description = "Number of nodes"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "subnet_id" {
  description = "Subnet ID for AKS"
  type        = string
}

variable "enable_auto_scaling" {
  description = "Enable auto-scaling"
  type        = bool
  default     = false
}

variable "min_node_count" {
  description = "Minimum node count (if auto-scaling enabled)"
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "Maximum node count (if auto-scaling enabled)"
  type        = number
  default     = 5
}

variable "network_plugin" {
  description = "Network plugin (azure or kubenet)"
  type        = string
  default     = "azure"
}

variable "network_policy" {
  description = "Network policy"
  type        = string
  default     = "azure"
}

variable "service_cidr" {
  description = "CIDR for cluster services"
  type        = string
  default     = "10.1.0.0/16"
}

variable "dns_service_ip" {
  description = "DNS service IP address"
  type        = string
  default     = "10.1.0.10"
}

variable "acr_id" {
  description = "ACR ID for AcrPull role assignment"
  type        = string
  default     = null
}

variable "ingress_ip_name" {
  description = "Public IP name for Ingress controller"
  type        = string
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
*/