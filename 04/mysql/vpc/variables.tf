variable "env_name" {
  type    = string
  default = null
  description = "VPC and subnet name"
}

variable "zone" {
  type    = string
  default = "ru-central1-a"
  description = "Subnet zone"
}

variable "cidr" {
  type        = list(string)
  default     = ["192.168.0.0/24"]
  description = "Subnet cidr"
}