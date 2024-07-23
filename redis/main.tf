terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "redis" {
  name = "redis:7"
  keep_locally = true
}

resource "docker_container" "redis-master" {
  image = docker_image.redis.image_id
  name = "redis-master"
  hostname = "redis-master"
  restart = "always"
  env = [
    "REDIS_DISABLE_COMMANDS=FLUSHDB,FLUSHALL,CONFIG",
    "REDIS_REPLICATION_MODE=master",
    "REDIS_PASSWORD=redismaster"
  ]
  ports {
    internal = 6379
    external = var.redis-port
  }
  volumes {
    container_path = "/data"
    volume_name = docker_volume.redis-data.name
  }
}

resource "docker_container" "redis-slave" {
  image = docker_image.redis.image_id
  name = "redis-slave"
  hostname = "redis-slave"
  restart = "always"
  depends_on = [docker_container.redis-master]
  env = [
    "REDIS_REPLICATION_MODE=slave",
    "REDIS_MASTER_HOST=redis-master",
    "REDIS_MASTER_PASSWORD=redismaster",
    "REDIS_MASTER_PORT_NUMBER=6379",
    "REDIS_PASSWORD=redisreplica"
  ]
}

resource "docker_volume" "redis-data" {
  name = "redis-data"
}
