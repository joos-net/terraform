provider "vault" {
 address = "http://127.0.0.1:8200"
 skip_tls_verify = true
 token = "education"

}
data "vault_generic_secret" "vault_example"{
 path = "secret/example"
}

resource "vault_generic_secret" "example" {
  path = "secret/test"

  data_json = <<EOT
{
  "username":   "my-username",
  "password": "very-secure-password"
}
EOT
}

data "vault_generic_secret" "example"{
 path = "secret/test"
}

output "vault_example" {
 value = "${nonsensitive(data.vault_generic_secret.vault_example.data)}"
} 

output "example" {
 value = "${nonsensitive(data.vault_generic_secret.example.data)}"
} 