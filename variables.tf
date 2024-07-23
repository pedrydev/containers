variable "mongodb-port" {
  description = "MongoDB port"
  type        = number
  default     = 27017
}

variable "redis-port" {
  description = "Redis port"
  type        = number
  default     = 6379
}

variable "rabbitmq-port" {
  description = "Rabbitmq port"
  type        = number
  default     = 5672
}

variable "rabbitmq-management-port" {
  description = "Rabbitmq management port"
  type        = number
  default     = 15672
}

variable "minio-port" {
  description = "MinIO port"
  type        = number
  default     = 9001
}
