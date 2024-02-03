resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  platform_id = var.vm_platform

  resources {
    core_fraction = var.vm_core_fraction
    cores         = var.vm_cores
    memory        = var.vm_memory
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_image
    }
  }

  network_interface {
    subnet_id = data.terraform_remote_state.vpc.outputs.subnet-1
    nat       = var.vm_nat
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3" 
  config  = {
    endpoint   = var.backend_endpoint
    bucket = var.backend_bucket
    region = var.backend_region
    key    = var.backend_key

    skip_region_validation      = var.region_validation
    skip_credentials_validation = var.credentials_validation

    shared_credentials_file = "~/storage.key"

   }
 }