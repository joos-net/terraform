resource "yandex_compute_disk" "disk" {
  count = 3
  name       = "disk-${count.index}"
  type       = "network-hdd"
  zone       = var.default_zone
  size       = 10
}

######################## Instance 1 ################################
resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = var.platform_id
  zone        = var.default_zone
  resources {
    cores         = var.cores
    memory        = var.memory
    core_fraction = var.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk.*.id
    content {
      disk_id = yandex_compute_disk.disk[secondary_disk.key].id
    }   
  }
  scheduling_policy {
    preemptible = var.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.nat
  }

  metadata = {
    serial-port-enable = var.metadata.vm.serial-port-enable
    ssh-keys           = local.ssh-keys
  }
    
}