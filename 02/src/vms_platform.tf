variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM OS family"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "VM platform"
}

variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "VM cores"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "VM memory"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 20
  description = "VM core fraction"
}

########################################################

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "VM name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "VM platform"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "VM cores"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "VM memory"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "VM core fraction"
}