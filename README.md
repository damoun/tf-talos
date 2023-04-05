<h1 align="center">
  <br><img src="project-logo.svg" height="192px">
  <br>
  tf-talos
  <br>
</h1>

<h4 align="center">Terraform plan to setup my Talos Linux clusters.</h4>

<p align="center">
  <a href="#getting-started">Getting Started</a> •
  <a href="#get-configurations">Get Configuration</a>
</p>

# Getting Started

Initialize terraform provider and apply the plan:

```
terraform init
terraform apply
```

# Get Configuration

Extract the configuration for Kubectl & Talos from the terraform output:

```
terraform output -raw cluster_zero_kubeconfig > ~/.kube/config
terraform output -raw cluster_zero_talosconfig > ~/.talos/config
```
