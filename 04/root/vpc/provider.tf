terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

    backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "test-joos"
    region     = "ru-central1"
    key        = "joos-vpc-state.tfstate"
    shared_credentials_file = "~/storage.key"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  service_account_key_file = file("~/authorized_key.json")
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}