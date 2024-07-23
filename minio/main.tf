terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "minio" {
  name = "quay.io/minio/minio"
}

resource "docker_container" "minio" {
  image = docker_image.minio.image_id
  name = "minio"
  restart = "always"
  hostname = "minio"
  env = [
    "MINIO_ROOT_USER=minioadmin",
    "MINIO_ROOT_PASSWORD=minioadmin"
  ]
  ports {
    internal = 9001
    external = var.minio-port
  }
  volumes {
    container_path = "/data"
    volume_name = docker_volume.minio.name
  }
}

resource "docker_volume" "minio" {
  name = "minio-data"
}
