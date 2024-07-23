variable "mongodb-port" {
  description = "MongoDB port"
  type        = number
}

variable "redis-port" {
  description = "Redis port"
  type        = number
}

variable "rabbitmq-port" {
  description = "Rabbitmq port"
  type        = number
}

variable "rabbitmq-management-port" {
  description = "Rabbitmq management port"
  type        = number
}

variable "minio-port" {
  description = "MinIO port"
  type        = number
}
