######################## Network ################################
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
######################## Subnet A################################
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone_a
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_a
  route_table_id = yandex_vpc_route_table.rt.id
}
######################## Subnet B################################
resource "yandex_vpc_subnet" "bd" {
  name           = var.subnet_db
  zone           = var.default_zone_b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_b
  route_table_id = yandex_vpc_route_table.rt.id
}
######################## NAT B################################
resource "yandex_vpc_gateway" "nat_gateway" {
  folder_id      = var.folder_id
  name = "test-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt" {
  folder_id      = var.folder_id
  name       = "test-route-table"
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}

######################## Image ################################
data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}

######################## Instance 1 ################################
resource "yandex_compute_instance" "platform" {
  name        = local.web_name
  platform_id = var.vms_resources.web.platform_id
  zone        = var.default_zone_a
  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    #nat       = true
  }

  metadata = {
    serial-port-enable = var.metadata.vm.serial-port-enable
    ssh-keys           = var.metadata.vm.ssh-keys
  }

}

######################## Instance 2 ################################
resource "yandex_compute_instance" "db" {
  name        = local.db_name
  platform_id = var.vms_resources.db.platform_id
  zone        = var.default_zone_b
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.bd.id
    #nat       = true
  }

  metadata = {
    serial-port-enable = var.metadata.vm.serial-port-enable
    ssh-keys           = var.metadata.vm.ssh-keys
  }

}