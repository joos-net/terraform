terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = ">=0.13" 
}

provider "docker" {
  host     = "ssh://joos@158.160.126.205:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

resource "random_password" "root_pass" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "random_password" "my_pass" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql" {
  name         = "mysql:8"
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql"
  env = [ "MYSQL_ROOT_PASSWORD=${random_password.root_pass.result}", 
          "MYSQL_DATABASE=wordpress", 
          "MYSQL_USER=wordpress", 
          "MYSQL_PASSWORD=${random_password.my_pass.result}", 
          "MYSQL_ROOT_HOST=%"
          ]

  ports {
    internal = 3306
    external = 3306
    ip = "127.0.0.1"
  }
}

