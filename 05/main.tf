
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
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