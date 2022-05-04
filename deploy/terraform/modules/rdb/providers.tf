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
  }
}
