locals {
  not_ha = [{   
      zone             = module.vpc_prod.public_subnet["net-ru-central1-a"].zone
      subnet_id        = module.vpc_prod.public_subnet["net-ru-central1-a"].subnet_id
    }]
  very_ha = [{   
      zone             = module.vpc_prod.public_subnet["net-ru-central1-a"].zone
      subnet_id        = module.vpc_prod.public_subnet["net-ru-central1-a"].subnet_id
    },{   
      zone             = module.vpc_prod.public_subnet["net-ru-central1-b"].zone
      subnet_id        = module.vpc_prod.public_subnet["net-ru-central1-b"].subnet_id
    }
    ]
}

module "vpc_prod" {
  source       = "./vpc_up"
  env_name     = "net"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
  ]
}

module "mysql_servers" {
  source = "./db_mysql"
    mysql_name = "my_sql_test"
    mysql_network_id = module.vpc_prod.vpc_id
    mysql_disk_size = 16
    HA = false
    hosts_definition = var.HA == false ? local.not_ha : local.very_ha
}

module "db_user" {
  source = "./database_user"
  db_name = "test"
  user_name = "app"
  cluster_id = module.mysql_servers.mysql_id
}