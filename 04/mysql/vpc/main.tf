#создаем облачную сеть
resource "yandex_vpc_network" "net" {
  name = var.env_name
}

#создаем подсеть
resource "yandex_vpc_subnet" "subnet" {
  name           = var.env_name
  zone           = var.zone
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = var.cidr
}