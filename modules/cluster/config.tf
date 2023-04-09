resource "talos_machine_secrets" "machine_secrets" {}

resource "talos_machine_configuration_controlplane" "controlplane" {
  cluster_name     = var.cluster_name
  cluster_endpoint = format("https://%s:6443", keys(var.node_data.controlplanes)[0])
  machine_secrets  = talos_machine_secrets.machine_secrets.machine_secrets
}

resource "talos_machine_configuration_worker" "worker" {
  cluster_name     = var.cluster_name
  cluster_endpoint = format("https://%s:6443", keys(var.node_data.controlplanes)[0])
  machine_secrets  = talos_machine_secrets.machine_secrets.machine_secrets
}

resource "talos_machine_configuration_apply" "controlplane" {
  for_each              = var.node_data.controlplanes
  talos_config          = talos_client_configuration.controlplane.talos_config
  machine_configuration = talos_machine_configuration_controlplane.controlplane.machine_config
  endpoint              = each.key
  node                  = each.key
  config_patches = [
    templatefile("${path.module}/templates/install.yaml.tmpl", {
      hostname     = each.value.hostname
      install_disk = each.value.install_disk
    }),
    templatefile("${path.module}/templates/vip.yaml.tmpl", {
      vip_address = var.vip_address
    }),
    file("${path.module}/files/cp-scheduling.yaml"),
    file("${path.module}/files/kubespan.yaml")
  ]
}

resource "talos_machine_configuration_apply" "worker" {
  for_each              = var.node_data.workers
  talos_config          = talos_client_configuration.controlplane.talos_config
  machine_configuration = talos_machine_configuration_worker.worker.machine_config
  endpoint              = each.key
  node                  = each.key
  config_patches = [
    templatefile("${path.module}/templates/install.yaml.tmpl", {
      hostname     = each.value.hostname
      install_disk = each.value.install_disk
    }),
    file("${path.module}/files/kubespan.yaml")
  ]
}
