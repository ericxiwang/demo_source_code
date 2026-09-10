variable "demo_sg_list" {
  description = "Map of security group name to allowed ingress port"
  type        = map(string)
  default = {
    ssh_sg        = "22"
    playwright_sg = "3000"
    rds_sg        = "3306"
  }
}

variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
  default     = "vpc-0a14b4cec945800d2"
}

variable "allowed_cidr" {
  description = "Default CIDR allowed on ingress"
  type        = string
  default     = "0.0.0.0/0"
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}