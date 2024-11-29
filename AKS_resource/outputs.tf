output "aks_name" {
  value = module.aks.name
}

output "kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}
