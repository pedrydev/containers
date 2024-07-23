terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "rabbitmq" {
  name = "rabbitmq:3-management"
  keep_locally = true
}

resource "docker_container" "rabbitmq" {
  image = docker_image.rabbitmq.image_id
  name = "rabbitmq"
  hostname = "rabbitmq"
  restart = "always"
  ports {
    internal = 5672
    external = var.rabbitmq-port
  }
  ports {
    internal = 15672
    external = var.rabbitmq-management-port
  }
  volumes {
    container_path = "/var/lib/rabbitmq"
    volume_name = docker_volume.rabbitmq-data.name
  }
  volumes {
    container_path = "/var/log/rabbitmq"
    volume_name = docker_volume.rabbitmq-logs.name
  }
}

resource "docker_volume" "rabbitmq-data" {
  name = "rabbitmq-data"
}

resource "docker_volume" "rabbitmq-logs" {
  name = "rabbitmq-logs"
}
