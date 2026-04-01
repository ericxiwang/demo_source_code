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

