###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default     = "b1gmtujeraulvnf2bj1i"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default = "b1ghauke2h8p27vt648a"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "metadata" {
    type = map(object({
      serial-port-enable = number
     #ssh-keys = string
    }))
    default = {
        vm = {
        serial-port-enable = 1
        #ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNOsMcZ6SDhHfkRbf/64aCLqVhJAmxh5EtXb52TXdTIlyf/NA5rNegRT1v1SJ5z6Me8AvHaZDAhLtvwUDlItjcTnzxCzQSLm07C7szwEgUrHG/++EPc/ZwH026ybep+n+yFmKAoUWq9VsGDhCt4TWu2g3jO9bZTSLTL7tgNDOMuCZq/GsZOj1+vnn0Cyve6gOlUPGOTHD83B7b8iM/lqLaSta2WZc/rbeidEBKUOt1KbmVcN3+l03nebTgKdde3PrQfhP+692DINKb5AJoYE3pw+CZ/AKfqn0sz/FGU2Vn3Kl2w9Uy70y8tiyjaXlBCM5iIx0auYgXTPjc9ywkd/HEKPaPcSknOE9CDrZ1wjO2g9eIAq6VdaudPh52SDdQKDPQ80zMhrQ9ZDFfRb6wrcn2wkUOlknAlI7wCt8r+dbgLgLUz+ObWJ4Uro8ItGyKuTqJt4NizSO2LNu/KcZefx6un6gccIlccXLKJSl3ay5FIlBgshHNjNSNrZ2FzTg/yGU= joos@jooss-MB.local"
    }}
}

variable "each_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk=number }))
  default = [ {
    vm_name = "main",
    cpu = 4,
    ram = 4,
    disk = 20
  },{
    vm_name = "replica",
    cpu = 2,
    ram = 2,
    disk = 10
  } ]
}