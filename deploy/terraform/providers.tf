terraform {
  required_version = ">= 0.13"

  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.2.0"
    }
  }
}

provider "scaleway" {
  zone       = "fr-par-1"
  region     = "fr-par"
  access_key = var.access_key
  secret_key = var.secret_key
}