variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  #default     = "us-east-1"
}

variable "instance_ami" {
  description = "AMI ID for the EC2 instance (Ubuntu 22.04)"
  type        = string
 # default     = "ami-0c2b8ca1dad447f8" # Update with the latest Ubuntu 22.04 AMI for your region
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  #default     = "t2.micro"
}

variable "ec2-sshkey" {
  description = "Name of the existing EC2 SSH key pair to use for the instances"
  type        = string
 # default     = "ec2-sshkey" # Update with the name of your existing SSH key pair
}

variable "ssh_sg_name" {
  description = "Name of the SSH security group"
  type        = string
  default     = "ssh_sg"
}

variable "playwright_sg_name" {
  description = "Name of the Playwright security group"
  type        = string
  default     = "playwright_sg"
}

variable "demo_sg_list" {
  description = "Map of SG name to port"
  type        = map(string)
  default = {
    ssh_sg        = "22"
    playwright_sg = "3000"
    rds_sg        = "3306"
  }
}

variable "common_tags" {
  type = map(string)
  default = {
    Project     = "demo"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

variable "vpc_id" {
  description = "VPC where SGs will be created"
  type        = string
  default     = "vpc-0a14b4cec945800d2"
}