variable demo_cidr_block {
  description = "Create a demo VPC with subnets, internet gateway, and route table"
  type        = string
  default     = "10.0.0.0/16"
}


variable demo_subnet_cidr_block_1 {
  description = "CIDR block for the demo subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable demo_subnet_cidr_block_2 {
  description = "CIDR block for the second demo subnet"
  type        = string
  default     = "10.0.12.0/24"
}

variable demo_availability_zone_1 {
  description = "Availability zone for the first demo subnet"
  type        = string
  default     = "us-east-1a"
}

variable demo_availability_zone_2 {
  description = "Availability zone for the second demo subnet"
  type        = string
  default     = "us-east-1b"
}