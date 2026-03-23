provider "aws" {
  region = var.rds_region # Choose your region
}

# 1. Define Variable for Password
variable "db_password" {
  description = "The password for the RDS user"
  type        = string
  sensitive   = true # Prevents password from printing to console
  default     = "!qAzXsW2#eDc"
}

# 2. Create Security Group for MySQL (Port 3306)
resource "aws_security_group" "rds_sg" {
  name = "rds-mysql-sg"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict this to your IP for better security
  }
}

# 3. Create Free Tier RDS MySQL Instance
resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.4.7"
  instance_class       = "db.t3.micro" # Free Tier eligible
  db_name              = "mydb"
  username             = "admin"
  password             = var.db_password # Using the variable
  parameter_group_name = "default.mysql8.4"
  skip_final_snapshot  = true
  publicly_accessible  = true # Set to false for private subnet
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}

output "rds_endpoint" {
  value = aws_db_instance.default.endpoint
}
