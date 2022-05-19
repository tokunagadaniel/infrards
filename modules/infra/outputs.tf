output "db_address" {
  description = "The address of the database."
  value       = module.db.this_db_instance_address
}

output "db_port" {
  description = "The port of the database service."
  value       = module.db.this_db_instance_port
}

output "db_security_group_id" {
  description = "The security group ID of the database service."
  value       = aws_security_group.db.id
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.db.this_db_instance_endpoint
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = module.db.this_db_instance_username
  sensitive   = true
}

output "db_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = module.db.this_db_instance_password
  sensitive   = true
}