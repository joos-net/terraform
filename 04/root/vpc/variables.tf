variable "network_name" {
    default = "network1"
    type = string
}
variable "subnet_name" {
    default = "subnet1"
    type = string
}
variable "cidr" {
  default = ["192.168.10.0/24"]
  type = tuple([ string ])
}


variable "cloud_id" {
    default = "b1gmtujeraulvnf2bj1i"
    type = string
}
variable "folder_id" {
    default = "b1ghauke2h8p27vt648a"
    type = string
}
variable "zone" {
    default = "ru-central1-b"    
    type = string
}