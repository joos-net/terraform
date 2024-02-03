resource "yandex_vpc_network" "network-1" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = var.subnet_name
  zone           = var.zone
  v4_cidr_blocks = var.cidr
  network_id     = yandex_vpc_network.network-1.id
}
