output "instance_name_platform" {
  value = {
    "Name Platform" : yandex_compute_instance.platform.name, 
    "IP Adress Platform" : yandex_compute_instance.platform.network_interface.0.nat_ip_address,
    "FQDN Platform" : yandex_compute_instance.platform.fqdn,
    "Name DB" : yandex_compute_instance.db.name, 
    "IP Adress DB" : yandex_compute_instance.db.network_interface.0.nat_ip_address,
    "FQDN DB" : yandex_compute_instance.db.fqdn}
}
