######################## Instance 1 ################################
resource "yandex_compute_instance" "count" {
  count       = 2
  name        = "web-${count.index + 1}"
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
  scheduling_policy {
    preemptible = var.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = var.metadata.vm.serial-port-enable
    ssh-keys           = local.ssh-keys
  }
    
  depends_on = [yandex_compute_instance.foreach]  

}