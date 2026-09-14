locals {
  name_prefix = "${var.project_name}-${var.environment}"
  
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

# DB Subnet Group using existing subnets
resource "aws_db_subnet_group" "this" {
  name       = "${local.name_prefix}-db-subnet-group"
  subnet_ids = var.subnet_ids

  #tags = merge(local.common_tags, {
   # Name = "${local.name_prefix}-db-subnet-group"
  #})

}

# Parameter group for MySQL (optional but useful for tuning)
resource "aws_db_parameter_group" "this" {
  name   = "${local.name_prefix}-mysql-params"
  family = "mysql8.0"

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }

  parameter {
    name  = "collation_server"
    value = "utf8mb4_unicode_ci"
  }

  #tags = merge(local.common_tags, {
   # Name = "${local.name_prefix}-mysql-params"
  #})
}

# RDS MySQL Instance
resource "aws_db_instance" "this" {
  identifier = "${local.name_prefix}-mysql"

  # Engine
  engine         = "mysql"
  engine_version = var.engine_version
  instance_class = var.instance_class

  # Storage
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type          = var.storage_type
  storage_encrypted     = true

  # Database
  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  port     = 3306

  # Networking
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = var.security_group_ids
  publicly_accessible    = false

  # Availability / HA
  multi_az = var.multi_az

  # Backups
  backup_retention_period = var.backup_retention_period
  backup_window           = "03:00-04:00"
  maintenance_window      = "Mon:04:00-Mon:05:00"

  # Parameter group
  parameter_group_name = aws_db_parameter_group.this.name

  # Lifecycle
  deletion_protection      = var.deletion_protection
  skip_final_snapshot      = var.skip_final_snapshot
  final_snapshot_identifier = var.skip_final_snapshot ? null : "${local.name_prefix}-mysql-final-snapshot"

  # Monitoring
  enabled_cloudwatch_logs_exports = ["error", "general", "slowquery"]
  #performance_insights_enabled    = true

  # Auto minor version upgrade
  auto_minor_version_upgrade = true

  apply_immediately = false

  tags = merge(local.common_tags, { Name = "${local.name_prefix}-mysql" })
}