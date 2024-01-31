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
  platform_id = var.platform_id
  zone        = var.default_zone
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = var.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk
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