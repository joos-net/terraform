###cloud vars

variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCu4SlumsUszV6DLd4F2Gff72vIN+F+Gk67CIWAS1+eGpt048gWOnMIaqjX1C6b0ocwUvYmTpPL6ZSzpEmp1hYFRGROeUj8B9SV5EEmFPNCmpztTuJ/u+L4qHID2aRggDwe8ikRcygnABpDSVwvCWMcB/434b1uHl+bsZYLj4k1dQmXZM4Ra3q6+99xy278vgUPmlxbcn4R1dzXLRDFH16znF0lHjH29XcxqYG802F2MfXyTnG5XT3Qul+UvP1vk5TntqtrrLsBRvMiudO6TrygTwyOqHJKxGbE7ZuUWgpnJJh1IHCfn5Bp23N5NVFneu7AlHtsSnpxg72O+rai+9XesrGAweAZ81k2eIVHoBwjM73s/5OEmS4NjxKCu8wIQ+gyA6rYG6sMrgHGsQiG1ELAn1Ta+m6oI0D9uBRFNOY6Bk6ulFva9zHo+Fh1Ix4fOSLGevE5j5QrUgJHoz6OktH7rev9w5nzSLGuigmnqgDOnIU48C0PIxepVkaNcjsIPwc= support@IT-C02D1K7AML7H.local"
}

variable "cloud_id" {
  type        = string
  default = "b1gmtujeraulvnf2bj1i"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default = "b1ghauke2h8p27vt648a"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}