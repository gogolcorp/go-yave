terraform {
  required_version = ">= 0.13"
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.9.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.4.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.13.1"
    }
  }
}

provider "scaleway" {
  zone       = "fr-par-1"
  region     = "fr-par"
  access_key = var.scw_access_key
  secret_key = var.scw_secret_key
}

provider "helm" {
  kubernetes {
    host  = module.k8s.cluster_host
    token = module.k8s.cluster_token
    cluster_ca_certificate = base64decode(
      module.k8s.cluster_ca_certificate
    )
  }
}

provider "kubectl" {
  host  = module.k8s.cluster_host
  token = module.k8s.cluster_token
  cluster_ca_certificate = base64decode(
    module.k8s.cluster_ca_certificate
  )
  load_config_file = false
}