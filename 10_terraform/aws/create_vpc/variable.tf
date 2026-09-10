variable demo_cidr_block {
  description = "Create a demo VPC with subnets, internet gateway, and route table"
  type        = string
  default     = "10.0.0.0/16"
}


variable demo_subnet_cidr_block {
  description = "CIDR block for the demo subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable demo_availability_zone {
  description = "Availability zone for the subnets"
  type        = string
  default     = "us-east-1a"
}