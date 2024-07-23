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

  mongodb-port  = var.mongodb-port
}

module "redis" {
  source = "./redis"

  redis-port = var.redis-port
}