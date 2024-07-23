output "mongodb-alias" {
  description = "MongoDB alias"
  value       = docker_container.mongodb.name
}

output "mongodb-port" {
  description = "MongoDB port"
  value       = var.mongodb-port
}
