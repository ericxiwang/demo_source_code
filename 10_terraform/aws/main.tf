provider "aws" {
  region = var.aws_region
}
# rds/main.tf
module "db_instance" {
  source = "./rds"
  rds_region = var.aws_region

}
# -----------------------------
# Security Group (allow SSH)
# -----------------------------
resource "aws_security_group" "demo1_sg" {
  name        = "demo1-sg"
  description = "Allow SSH inbound"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# -----------------------------
# EC2 Instance (Ubuntu 22.04)
# -----------------------------
resource "aws_instance" "jenkins-server" {
  ami           = var.instance_ami

  instance_type = var.instance_type

  key_name               = var.ec2-sshkey
  vpc_security_group_ids = [aws_security_group.demo1_sg.id]

  # -------------------------
  # Root EBS volume config
  # -------------------------
  root_block_device {
    volume_size = 8 # GB
    volume_type = "gp3"
    encrypted   = false
  }



  tags = {
    Name = "jenkins-server"
  }
}
resource "aws_instance" "playwright-server" {
  ami           = var.instance_ami

  instance_type = var.instance_type

  key_name               = var.ec2-sshkey
  vpc_security_group_ids = [aws_security_group.demo1_sg.id]

  # -------------------------
  # Root EBS volume config
  # -------------------------
  root_block_device {
    volume_size = 8 # GB
    volume_type = "gp3"
    encrypted   = false
  }



  tags = {
    Name = "playwright-server"
  }
}
