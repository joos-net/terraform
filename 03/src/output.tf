output "count_vm" {
    value = [for server in yandex_compute_instance.count : {"name" = server.name, "id" = server.id, "fqdn" = server.fqdn}]
}

output "foreach_vm" {
    value = [for server in yandex_compute_instance.foreach : {"name" = server.name, "id" = server.id, "fqdn" = server.fqdn}]
}