terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

module "mongodb" {
  source = "./mongodb"

  mongodb-alias = var.mongodb-alias
  mongodb-port  = var.mongodb-port
}
