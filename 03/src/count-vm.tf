######################## Image ################################
data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}

######################## Instance 1 ################################
resource "yandex_compute_instance" "count" {
  count       = 2
  name        = "web-${count.index + 1}"
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
  scheduling_policy {
    preemptible = true
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