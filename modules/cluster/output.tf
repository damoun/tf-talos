output "machineconfig_controlplane" {
  value     = talos_machine_configuration_controlplane.controlplane.machine_config
  sensitive = true
}

output "machineconfig_worker" {
  value     = talos_machine_configuration_worker.worker.machine_config
  sensitive = true
}

output "talosconfig" {
  value     = talos_client_configuration.controlplane.talos_config
  sensitive = true
}

output "kubeconfig" {
  value     = talos_cluster_kubeconfig.kubeconfig.kube_config
  sensitive = true
}
