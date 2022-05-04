output "k8s_host" {
  value = module.k8s.cluster_host
}

output "k8s_token" {
  value = module.k8s.cluster_token
}

output "k8s_ca_certificate" {
  value = module.k8s.cluster_ca_certificate
}

output "k8s_kubeconfig" {
  value = module.k8s.cluster_kubeconfig
}