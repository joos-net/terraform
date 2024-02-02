output "public_subnet" {
  description = "info yandex_vpc_subnet"
  value = {
    "subnet_id"      = yandex_vpc_subnet.subnet.id,
    "name"           = yandex_vpc_subnet.subnet.name,
    "zone"           = yandex_vpc_subnet.subnet.zone
    "v4_cidr_blocks" = yandex_vpc_subnet.subnet.v4_cidr_blocks
    }
}

output "vpc_id" {
  value = yandex_vpc_network.net.id
}