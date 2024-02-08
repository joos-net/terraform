
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "= 0.107.0"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
        endpoint = "storage.yandexcloud.net"
        bucket = "joos-tfstate"
        region = "ru-central1"
        key = "test-joos-terraform.tfstate"
        skip_region_validation = true
        skip_metadata_api_check = true
        skip_credentials_validation = true
        force_path_style = true
        shared_credentials_file = "~/storage.key"
        dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1gmtujeraulvnf2bj1i/etn88fqlsso8lii64a3q"
        dynamodb_table = "joos-table"
    }
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  service_account_key_file = file("~/authorized_key.json")
  zone                     = "ru-central1-b"
}

# Бастион хост
resource "yandex_compute_instance" "compose" {

  zone = "ru-central1-a"
  name = "test"

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8s17cfki4sd4l6oa59"
      size     = 15
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.subnet.id
    #nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    user-data = "./meta.yml"
  }

}

resource "yandex_vpc_network" "network" {
  name = "network"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}


resource "yandex_vpc_security_group" "example" {
  name        = "Test security group"
  description = "Description for security group"
  network_id  = yandex_vpc_network.network.id

  ingress {
    protocol       = "TCP"
    description    = "Rule description 1"
    v4_cidr_blocks = ["192.168.10.0/24"]
    port           = 8080
  }

  egress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["192.168.10.0/24"]
    from_port      = 8090
    to_port        = 8099
  }
}