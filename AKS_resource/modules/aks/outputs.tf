output "name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}
