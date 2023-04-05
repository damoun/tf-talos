moved {
  from = talos_client_configuration.controlplane
  to   = module.cluster_zero.talos_client_configuration.controlplane
}

moved {
  from = talos_machine_secrets.machine_secrets
  to   = module.cluster_zero.talos_machine_secrets.machine_secrets
}

moved {
  from = talos_machine_configuration_controlplane.controlplane
  to   = module.cluster_zero.talos_machine_configuration_controlplane.controlplane
}

moved {
  from = talos_machine_configuration_worker.worker
  to   = module.cluster_zero.talos_machine_configuration_worker.worker
}

moved {
  from = talos_machine_configuration_apply.controlplane
  to   = module.cluster_zero.talos_machine_configuration_apply.controlplane
}

moved {
  from = talos_machine_configuration_apply.controlplane
  to   = module.cluster_zero.talos_machine_configuration_apply.controlplane
}

moved {
  from = talos_machine_configuration_apply.worker
  to   = module.cluster_zero.talos_machine_configuration_apply.worker
}

moved {
  from = talos_machine_bootstrap.bootstrap
  to   = module.cluster_zero.talos_machine_bootstrap.bootstrap
}

moved {
  from = talos_cluster_kubeconfig.kubeconfig
  to   = module.cluster_zero.talos_cluster_kubeconfig.kubeconfig
}

moved {
  from = talos_cluster_kubeconfig.kubeconfig
  to   = module.cluster_zero.talos_cluster_kubeconfig.kubeconfig
}

module "cluster_zero" {
  source = "./modules/cluster"

  cluster_name = "cluster-0"
  node_data = {
    controlplanes = {
      "192.168.2.19" = {
        hostname     = "talos-controlplane-owjy"
        install_disk = "/dev/sda"
      },
      "192.168.2.20" = {
        hostname     = "talos-controlplane-usyj"
        install_disk = "/dev/sda"
      },
      "192.168.2.21" = {
        hostname     = "talos-controlplane-wffd"
        install_disk = "/dev/sda"
      }
    }
    workers = {
      "192.168.2.18" = {
        hostname     = "talos-worker-zfsj"
        install_disk = "/dev/sda"
      },
      "192.168.2.130" = {
        hostname     = "talos-worker-bsci"
        install_disk = "/dev/sda"
      },
      "192.168.2.132" = {
        hostname     = "talos-worker-ptjd"
        install_disk = "/dev/sda"
      }
    }
  }
}
