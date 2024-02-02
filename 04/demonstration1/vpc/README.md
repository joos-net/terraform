## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.net](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | Subnet cidr | `list(string)` | <pre>[<br>  "192.168.0.0/24"<br>]</pre> | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | VPC and subnet name | `string` | `null` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Subnet zone | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_subnet"></a> [public\_subnet](#output\_public\_subnet) | info yandex\_vpc\_subnet |
