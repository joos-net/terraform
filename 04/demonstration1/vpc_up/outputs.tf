output "public_subnet" {
  description = "info yandex_vpc_subnet"
  value = { for v in yandex_vpc_subnet.subnet : v.v4_cidr_blocks[0] => {
    "subnet_id"      = v.id,
    "name"           = v.name,
    "zone"           = v.zone
    "v4_cidr_blocks" = v.v4_cidr_blocks
    }
  }
}