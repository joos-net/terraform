# #создаем облачную сеть
# resource "yandex_vpc_network" "develop" {
#   name = "develop"
# }

# #создаем подсеть
# resource "yandex_vpc_subnet" "develop" {
#   name           = "develop-ru-central1-a"
#   zone           = "ru-central1-a"
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = ["10.0.1.0/24"]
# }

# module "vpc_dev" {
#   source = "./vpc"
#   env_name = "develop"
#   zone = "ru-central1-a"
#   cidr = ["10.0.1.0/24"]
# }

module "vpc_dev" {
  source       = "./vpc_up"
  env_name     = "develop"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
  ]
}

module "vpc_prod" {
  source       = "./vpc_up"
  env_name     = "production"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-c", cidr = "10.0.3.0/24" },
  ]
}

# module "marketing-vm" {
#   source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
#   env_name       = "marketing"
#   network_id     = module.vpc_dev.public_subnet.subnet_id
#   subnet_zones   = ["ru-central1-a"]
#   subnet_ids     = [module.vpc_dev.public_subnet.subnet_id]
#   instance_name  = "web"
#   instance_count = 1
#   image_family   = "ubuntu-2004-lts"
#   public_ip      = true
#   labels = { "project" = "marketing" }

#   metadata = {
#     user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
#     serial-port-enable = 1
#   }

# }

# module "analytics-vm" {
#   source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
#   env_name       = "analytics"
#   network_id     = module.vpc_dev.public_subnet.subnet_id
#   subnet_zones   = ["ru-central1-a"]
#   subnet_ids     = [module.vpc_dev.public_subnet.subnet_id]
#   instance_name  = "web-stage"
#   instance_count = 1
#   image_family   = "ubuntu-2004-lts"
#   public_ip      = true
#   labels = { "project" = "analytics" }

#   metadata = {
#     user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
#     serial-port-enable = 1
#   }

# }

# #Пример передачи cloud-config в ВМ для демонстрации №3
# data "template_file" "cloudinit" {
#   template = file("./cloud-init.yml")
#   vars = {
#     ssh_public_key     = var.public_key
#   }
# }

