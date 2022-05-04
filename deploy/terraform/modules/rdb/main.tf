
resource "random_password" "rdb_password" {
  length           = 16
  min_numeric      = 2
  min_upper        = 2
  min_special      = 2
  override_special = var.override_special
}

resource "scaleway_rdb_database" "rdb_database" {
  instance_id = var.rdb_instance_id
  name        = var.environment
}

resource "scaleway_rdb_user" "rdb_user" {
  instance_id = var.rdb_instance_id
  name        = var.environment
  password    = random_password.rdb_password.result
  is_admin    = false
}

resource "scaleway_rdb_privilege" "rdb_privilege" {
  depends_on = [scaleway_rdb_database.rdb_database, scaleway_rdb_user.rdb_user]

  instance_id   = var.rdb_instance_id
  user_name     = var.environment
  database_name = var.environment
  permission    = "all"
}

resource "kubernetes_namespace" "environment" {
  metadata {
    name = var.environment
  }
}