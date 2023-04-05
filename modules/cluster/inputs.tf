variable "cluster_name" {
  description = "A name to provide for the Talos cluster"
  type        = string
  default     = "cluster-0"
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
