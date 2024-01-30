resource "yandex_compute_disk" "disk" {
  count = 3
  name       = "empty-disk-${count.index}"
  type       = "network-hdd"
  zone       = var.default_zone
  size       = 10
}

######################## Instance 1 ################################
resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = "standard-v3"
  zone        = var.default_zone
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk.*.id
    content {
      disk_id = yandex_compute_disk.disk[secondary_disk.value].id
    }   
  }
  scheduling_policy {
    preemptible = trueterraform
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = var.metadata.vm.serial-port-enable
    ssh-keys           = local.ssh-keys
  }
    
  depends_on = [yandex_compute_instance.foreach]  

}