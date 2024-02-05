variable "ip-a" {
  type = string
  description="ip-адрес"
  default = "1920.1680.0.1"
  validation {
    error_message = "Must be valid IP"
    condition     = can(regex("^((25[0-5]|(2[0-4]|1\\d|[1-9]|)\\d)\\.?\\b){4}$", var.ip-a))
  }
}

variable "ip-l" {
  type = list(string)
  description="список ip-адресов"
  default = ["192.168.0.1", "1.1.1.1", "1270.0.0.1"]
  validation {
    error_message = "Must be valid IP list."
    condition = can([for s in var.ip-l : regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}(\\/([0-9]|[1-2][0-9]|3[0-2]))?$", s)])
  }
}