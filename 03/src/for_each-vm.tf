locals {
  ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
}

######################## Instance 1 ################################
resource "yandex_compute_instance" "foreach" {
   for_each   = {
    for index, vm in var.each_vm:
    vm.vm_name => vm
}
  name        = each.value.vm_name
  platform_id = "standard-v3"
  zone        = var.default_zone
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk
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

}