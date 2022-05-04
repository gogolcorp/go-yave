# Authentification --------------------------------------------------

variable "access_key" {
  type = string
  description = "Scaleway access key to use API."
}
variable "secret_key" {
  type = string
  description = "Scaleway secret key to use API."
}
variable "project_id" {
  type = string
  description = "Scaleway current project ID."
}

# Environments ------------------------------------------------------

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
    type           = string
    engine         = string
    user_name      = string
    is_ha_cluster  = bool
    disable_backup = bool
  })
  description = "The instance where the environment rdbs will be created."
}


# Kubernetes --------------------------------------------------------

# variable "cluster_name" {
#   type        = string
#   description = "Cluster name"
# }
# variable "cluster_version" {
#   type        = string
#   description = "Kubernetes version"
#   default     = "1.22"
# }
# variable "cluster_tags" {
#   type        = set(string)
#   description = "Labels of the cluster"
# }

# variable "node_pool_name" {
#   type        = string
#   description = "Node pool type"
#   default     = "workload"
# }

# variable "node_pool_node_type" {
#   type        = string
#   description = "Node pool type"
#   default     = "DEV1-M"
# }

# variable "node_pool_min_size" {
#   type        = number
#   description = "Node pool min size"
#   default     = 1
# }

# variable "node_pool_max_size" {
#   type        = number
#   description = "Node pool max size"
#   default     = 6
# }

# variable "node_pool_tags" {
#   type        = set(string)
#   description = "Node labels and taints"
#   default     = []
# }


# variable "install_ingress" {
#   type        = bool
#   description = "Install Ingress"
#   default     = true
# }

# variable "install_cert_manager" {
#   type        = bool
#   description = "Install Cert Manager"
#   default     = true
# }


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

# variable "vault_node_pool_node_type" {
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
