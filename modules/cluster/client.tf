resource "talos_client_configuration" "controlplane" {
  cluster_name    = var.cluster_name
  machine_secrets = talos_machine_secrets.machine_secrets.machine_secrets
  endpoints       = keys(var.node_data.controlplanes)
  nodes           = keys(var.node_data.controlplanes)
}
