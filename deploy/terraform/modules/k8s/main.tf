resource "scaleway_k8s_cluster" "k8s_cluster" {
  project_id  = var.scw_project_id
  name        = var.cluster.name
  tags        = var.cluster.tags
  version     = var.cluster.version
  cni         = var.cluster.cni

  auto_upgrade {
    enable                        = true
    maintenance_window_day        = var.cluster.maintenance_window_day
    maintenance_window_start_hour = var.cluster.maintenance_window_start_hour
  }

  autoscaler_config {
    disable_scale_down              = false
    scale_down_delay_after_add      = "5m"
    estimator                       = "binpacking"
    expander                        = "random"
    ignore_daemonsets_utilization   = true
    balance_similar_node_groups     = true
    expendable_pods_priority_cutoff = -5
  }
}

resource "scaleway_k8s_pool" "k8s_pool" {
  depends_on = [scaleway_k8s_cluster.k8s_cluster]

  cluster_id          = scaleway_k8s_cluster.k8s_cluster.id
  name                = var.pool.name
  tags                = var.pool.tags
  node_type           = var.pool.type
  size                = var.pool.min_size
  min_size            = var.pool.min_size
  max_size            = var.pool.max_size
  autoscaling         = true
  autohealing         = true
  wait_for_pool_ready = true
  container_runtime   = "containerd"
}