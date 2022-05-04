# Scaleway authentification -----------------------------------------

variable "scw_access_key" {
  type        = string
  description = "Scaleway access key to use API."
}
variable "scw_secret_key" {
  type        = string
  description = "Scaleway secret key to use API."
}
variable "scw_project_id" {
  type        = string
  description = "Scaleway current project ID."
}

# Miscellaneous -----------------------------------------------------

variable "environments" {
  type        = set(string)
  description = "Environments to be created."
}

variable "override_special" {
  type        = string
  description = "Special characters for random password."
  default     = "!#*()-_+"
}

# Database ----------------------------------------------------------

variable "rdb_instance" {
  type = object({
    name           = string
    tags           = set(string)
    type           = string
    engine         = string
    user_name      = string
    is_ha_cluster  = bool
    disable_backup = bool
  })
  description = "The instance where the different environments databases will be created."
}

# Kubernetes --------------------------------------------------------

variable "k8s_cluster" {
  type = object({
    name                          = string
    tags                          = set(string)
    version                       = string
    cni                           = string
    maintenance_window_day        = string
    maintenance_window_start_hour = number
  })
  description = "The Kubernetes cluster where the different environments/namespaces will be created."
}

variable "k8s_pool" {
  type = object({
    name     = string
    tags     = set(string)
    type     = string
    min_size = number
    max_size = number
  })
  description = "The Kubernetes node pool  where the different environments/namespaces will be created."
}

variable "install_ingress" {
  type        = bool
  description = "Install Ingress"
  default     = true
}

variable "install_cert_manager" {
  type        = bool
  description = "Install Cert Manager"
  default     = true
}


# variable "install_argocd" {
#   type        = bool
#   description = "Install ArgoCD"
#   default     = true
# }

# variable "install_vault" {
#   type        = bool
#   description = "Install Vault"
#   default     = true
# }

# variable "vault_pool_node_type" {
#   type = string
#   default = "DEV1-L"
# }

# variable "install_external_secrets" {
#   type        = bool
#   description = "Install External Secrets"
#   default     = true
# }

# variable "install_backup" {
#   type        = bool
#   description = "Install Velero"
#   default     = true
# }

# variable "backup_bucket_name" {
#   type        = string
#   description = "Backup bucket name"
# }

# variable "install_keycloak" {
#   type        = bool
#   description = "Install Keycloak"
#   default     = false
# }
