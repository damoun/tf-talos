resource "talos_machine_bootstrap" "bootstrap" {
  talos_config = talos_client_configuration.controlplane.talos_config
  endpoint     = keys(var.node_data.controlplanes)[0]
  node         = keys(var.node_data.controlplanes)[0]
}
