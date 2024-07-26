terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "aspire" {
  name = "mcr.microsoft.com/dotnet/aspire-dashboard:8.0.0"
}

resource "docker_container" "aspire" {
  image = docker_image.aspire.image_id
  name = "aspire"
  ports {
    internal = 18888
    external = var.aspire-dashboard-port
  }
  ports {
    internal = 18889
    external = var.aspire-endpoint
  }
}
