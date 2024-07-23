terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "mongodb" {
  name         = "mongo:6"
  keep_locally = true
}

resource "docker_container" "mongodb" {
  image   = docker_image.mongodb.image_id
  name    = "mongodb"
  hostname = "mongodb"
  restart = "always"
  env = [
    "MONGO_INITDB_ROOT_USERNAME=mongoadmin",
    "MONGO_INITDB_ROOT_PASSWORD=mongoadmin"
  ]
  ports {
    internal = 27017
    external = var.mongodb-port
  }
  volumes {
    container_path = "/data/db"
    volume_name    = docker_volume.mongo-data.name
  }
  volumes {
    container_path = "/var/log/mongodb"
    volume_name    = docker_volume.mongo-logs.name
  }
}

resource "docker_volume" "mongo-data" {
  name = "mongo-data"
}

resource "docker_volume" "mongo-logs" {
  name = "mongo-logs"
}
