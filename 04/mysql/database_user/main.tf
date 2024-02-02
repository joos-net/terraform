resource "yandex_mdb_mysql_database" "db" {
  cluster_id = var.cluster_id
  name       = var.db_name
}

resource "yandex_mdb_mysql_user" "user" {
  cluster_id = var.cluster_id
  name       = var.user_name
  password   = random_password.user_password.result
  permission {
    database_name = yandex_mdb_mysql_database.db.name
    roles         = ["ALL"]
  }
}

resource "random_password" "user_password" {
  length      = 16
  special     = true
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}