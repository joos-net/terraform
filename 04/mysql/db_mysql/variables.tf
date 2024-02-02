variable "HA" {
  type = bool
  default = false
  description = "high availability"
}


variable "mysql_name" {
  type = string
  default = "my-mysql"
}

variable "mysql_environment" {
  type = string
  default = "PRESTABLE"
}

variable "mysql_network_id" {
  type = string
}

variable "mysql_version" {
  type = string
  default = "8.0"
}


variable "mysql_resource_preset_id" {
  type = string
  default = "s2.micro"
}

variable "mysql_disk_type_id" {
  type = string
  default = "network-ssd"
}

variable "mysql_disk_size" {
  type = number
  default = 32
}

variable "hosts_definition" {
  description = "MySQL hosts."

  type = list(object({
    zone                    = string
    subnet_id               = optional(string, null)
    assign_public_ip        = optional(bool, false)
  }))
  default = [
    {     zone               = "ru-central1-a"
          assign_public_ip        = true
    }
  ]
}