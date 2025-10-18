/*
output "aks_id" {
  description = "AKS cluster resource ID"
  value       = azurerm_kubernetes_cluster.this.id
}

output "aks_name" {
  description = "AKS cluster name"
  value       = azurerm_kubernetes_cluster.this.name
}

output "kube_config_raw" {
  description = "Kubeconfig (sensitive)"
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive   = true
}

output "node_resource_group" {
  description = "Node Resource Group for AKS"
  value       = azurerm_kubernetes_cluster.this.node_resource_group
}

output "kubelet_identity_object_id" {
  description = "Object ID of the AKS kubelet identity"
  value       = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}

output "ingress_public_ip" {
  description = "Public IP address for Ingress"
  value       = azurerm_public_ip.ingress.ip_address
}

output "ingress_public_ip_fqdn" {
  description = "FQDN of the Ingress public IP"
  value       = azurerm_public_ip.ingress.fqdn
}
*/