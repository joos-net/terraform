output "public_subnet" {
  description = "info yandex_vpc_subnet"
  value = { for v in yandex_vpc_subnet.subnet : v.name => {
    "subnet_id"      = v.id,
    "name"           = v.name,
    "zone"           = v.zone
    #"v4_cidr_blocks" = v.v4_cidr_blocks
    }
  }
}

output "vpc_id" {
  value = yandex_vpc_network.net.id
}