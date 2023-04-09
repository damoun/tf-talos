variable "cluster_name" {
  description = "A name to provide for the Talos cluster"
  type        = string
  default     = "cluster-0"
}

variable "vip_address" {
  description = "A Virtual IP address to reach the control plane"
  type        = string
}

variable "node_data" {
  description = "A map of node data"
  type = object({
    controlplanes = map(object({
      install_disk = string
      hostname     = string
    }))
    workers = map(object({
      install_disk = string
      hostname     = string
    }))
  })
}
