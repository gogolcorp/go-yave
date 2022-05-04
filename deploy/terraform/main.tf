
resource "random_password" "rdb_instance_password" {
  length           = 16
  min_numeric      = 2
  min_upper        = 2
  min_special      = 2
  override_special = var.override_special
}

resource "scaleway_rdb_instance" "rdb_instance" {
  project_id     = var.project_id
  name           = var.rdb_instance.name
  node_type      = var.rdb_instance.type
  engine         = var.rdb_instance.engine
  is_ha_cluster  = var.rdb_instance.is_ha_cluster
  disable_backup = var.rdb_instance.disable_backup
  user_name      = var.rdb_instance.user_name
  password       = random_password.rdb_instance_password.result
}

module "rdb" {
  source     = "./modules/rdb"
  depends_on = [scaleway_rdb_instance.rdb_instance]

  for_each         = var.environments
  environment = each.value

  rdb_instance_id  = scaleway_rdb_instance.rdb_instance.id
  override_special = var.override_special
}

# module "cluster" {
#   source = "./modules/cluster"

#   project_id           = var.project_id
#   access_key           = var.access_key
#   secret_key           = var.secret_key
#   cluster_name         = var.cluster_name
#   cluster_version      = var.cluster_version
#   cluster_tags         = var.cluster_tags
#   node_pool_name       = var.node_pool_name
#   node_pool_node_type  = var.node_pool_node_type
#   node_pool_min_size   = var.node_pool_min_size
#   node_pool_max_size   = var.node_pool_max_size
#   node_pool_tags       = var.node_pool_tags
#   install_ingress      = var.install_ingress
#   install_cert_manager = var.install_cert_manager
# }