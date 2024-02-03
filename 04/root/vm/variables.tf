variable "vm_name" {
    default = "my-test"
    type = string
}
variable "vm_platform" {
    default = "standard-v3"
    type = string
}

variable "vm_core_fraction" {
    default = 20
    type = number
}
variable "vm_cores" {
    default = 2
    type = number
}
variable "vm_memory" {
    default = 4
    type = number
}
variable "vm_image" {
    default = "fd8clogg1kull9084s9o"
    type = string
}
variable "vm_nat" {
    default = true
    type = bool
}

variable "backend_endpoint" {
    default = "storage.yandexcloud.net"
    type = string
}
variable "backend_bucket" {
    default = "test-joos"
    type = string
}
variable "backend_region" {
    default = "ru-central1"
    type = string
}
variable "backend_key" {
    default = "joos-vpc-state.tfstate"
    type = string
}
variable "region_validation" {
    default = true
    type = bool
}
variable "credentials_validation" {
    default = true
    type = bool
}

variable "cloud_id" {
  default = "b1gmtujeraulvnf2bj1i"
}
variable "folder_id" {
  default = "b1ghauke2h8p27vt648a"
}
variable "zone" {
  default = "ru-central1-b"
}