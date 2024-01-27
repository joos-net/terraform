variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM OS family"
}

# variable "vm_web_name" {
#   type        = string
#   default     = "netology-develop-platform-web"
#   description = "VM name"
# }

# variable "vm_web_platform_id" {
#   type        = string
#   default     = "standard-v3"
#   description = "VM platform"
# }

# variable "vm_web_cores" {
#   type        = number
#   default     = 2
#   description = "VM cores"
# }

# variable "vm_web_memory" {
#   type        = number
#   default     = 1
#   description = "VM memory"
# }

# variable "vm_web_core_fraction" {
#   type        = number
#   default     = 20
#   description = "VM core fraction"
# }

########################################################

# variable "vm_db_name" {
#   type        = string
#   default     = "netology-develop-platform-db"
#   description = "VM name"
# }

# variable "vm_db_platform_id" {
#   type        = string
#   default     = "standard-v3"
#   description = "VM platform"
# }

# variable "vm_db_cores" {
#   type        = number
#   default     = 2
#   description = "VM cores"
# }

# variable "vm_db_memory" {
#   type        = number
#   default     = 2
#   description = "VM memory"
# }

# variable "vm_db_core_fraction" {
#   type        = number
#   default     = 20
#   description = "VM core fraction"
# }


variable "vms_resources" {
  type = map(object({
    name = string
    platform_id = string
    cores = number
    memory = number
    core_fraction = number
  }))
  default = {
    web = {
        name = "netology-develop-platform-web"
        platform_id = "standard-v3"
        cores = 2
        memory = 1
        core_fraction = 20
    }
    db = {
        name = "netology-develop-platform-db"
        platform_id = "standard-v3"
        cores = 2
        memory = 2
        core_fraction = 20
    }
  }
}

variable "metadata" {
    type = map(object({
      serial-port-enable = number
      ssh-keys = string
    }))
    default = {
        vm = {
        serial-port-enable = 1
        ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNOsMcZ6SDhHfkRbf/64aCLqVhJAmxh5EtXb52TXdTIlyf/NA5rNegRT1v1SJ5z6Me8AvHaZDAhLtvwUDlItjcTnzxCzQSLm07C7szwEgUrHG/++EPc/ZwH026ybep+n+yFmKAoUWq9VsGDhCt4TWu2g3jO9bZTSLTL7tgNDOMuCZq/GsZOj1+vnn0Cyve6gOlUPGOTHD83B7b8iM/lqLaSta2WZc/rbeidEBKUOt1KbmVcN3+l03nebTgKdde3PrQfhP+692DINKb5AJoYE3pw+CZ/AKfqn0sz/FGU2Vn3Kl2w9Uy70y8tiyjaXlBCM5iIx0auYgXTPjc9ywkd/HEKPaPcSknOE9CDrZ1wjO2g9eIAq6VdaudPh52SDdQKDPQ80zMhrQ9ZDFfRb6wrcn2wkUOlknAlI7wCt8r+dbgLgLUz+ObWJ4Uro8ItGyKuTqJt4NizSO2LNu/KcZefx6un6gccIlccXLKJSl3ay5FIlBgshHNjNSNrZ2FzTg/yGU= joos@jooss-MB.local"
    }}
}