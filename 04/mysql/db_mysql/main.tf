resource "yandex_mdb_mysql_cluster" "my-mysql" {
  name                = var.mysql_name
  environment         = var.mysql_environment
  network_id          = var.mysql_network_id
  version             = var.mysql_version

  resources {
    resource_preset_id = var.mysql_resource_preset_id
    disk_type_id       = var.mysql_disk_type_id
    disk_size          = var.mysql_disk_size
  }

  dynamic "host" {
    for_each = var.hosts_definition
    content {
      zone                    = host.value.zone
      subnet_id               = host.value.subnet_id
      assign_public_ip        = host.value.assign_public_ip
    }
  }
}