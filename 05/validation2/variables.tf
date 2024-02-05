variable "low-c" {
  type = string
  description="любая строка"
  default = "value"
  validation {
    error_message = "its not lower case!"
    condition     = can(regex("^[a-z]+$", var.low-c))
  }
}

# variable "in_the_end_there_can_be_only_one" {
#     description="Who is better Connor or Duncan?"
#     type = object({
#         Dunkan = optional(bool)
#         Connor = optional(bool)
#     })

#     default = {
#         Dunkan = true
#         Connor = false
#     }

#     validation {
#         error_message = "There can be only one MacLeod"
#         condition = "<проверка>"
#     }
# }