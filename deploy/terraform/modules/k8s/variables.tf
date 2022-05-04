# Scaleway authentification -----------------------------------------

variable "scw_project_id" {
  type        = string
  description = "Scaleway current project ID."
}

# Kubernetes --------------------------------------------------------

variable "cluster" {
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

variable "pool" {
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