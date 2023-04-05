output "cluster_zero_kubeconfig" {
  value     = module.cluster_zero.kubeconfig
  sensitive = true
}

output "cluster_zero_talosconfig" {
  value     = module.cluster_zero.talosconfig
  sensitive = true
}
