output "cluster_id" {
  value = scaleway_k8s_cluster.k8s_cluster.id
}

output "cluster_host" {
  value = scaleway_k8s_cluster.k8s_cluster.kubeconfig[0].host
}

output "cluster_token" {
  value = scaleway_k8s_cluster.k8s_cluster.kubeconfig[0].token
}

output "cluster_ca_certificate" {
  value = scaleway_k8s_cluster.k8s_cluster.kubeconfig[0].cluster_ca_certificate
}

output "cluster_pool_id" {
  value = scaleway_k8s_pool.k8s_pool.id
}

output "cluster_kubeconfig" {
  value = scaleway_k8s_cluster.k8s_cluster.kubeconfig[0].config_file
}
