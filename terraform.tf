terraform {
  cloud {
    organization = "damoun"

    workspaces {
      name = "talos"
    }
  }
}
