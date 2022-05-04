
resource "random_password" "rdb_instance_password" {
  length           = 16
  min_numeric      = 2
  min_upper        = 2
  min_special      = 2
  override_special = var.override_special
}

resource "scaleway_rdb_instance" "rdb_instance" {
  project_id     = var.scw_project_id
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
  for_each   = var.environments

  environment      = each.value
  override_special = var.override_special
  rdb_instance_id  = scaleway_rdb_instance.rdb_instance.id
}

module "k8s" {
  source = "./modules/k8s"

  scw_project_id       = var.scw_project_id
  cluster              = var.k8s_cluster
  pool                 = var.k8s_pool
  install_ingress      = var.install_ingress
  install_cert_manager = var.install_cert_manager
}