module "cluster_zero" {
  source = "./modules/cluster"

  cluster_name = "cluster-0"
  vip_address  = "192.168.2.151"
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
