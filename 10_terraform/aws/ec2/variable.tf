variable ec2_config {
  description = "EC2 instance configuration"
  type = object({
    ami           = string
    instance_type = string
  })
  default = {
    ami           = "ami-052355af2a014bd2c" # Example AMI ID, replace with your own
    instance_type = "t3.micro"
  }
}

variable ec2_tags {
  description = "Tags for the EC2 instance"
  type        = map(string)
  default     = {
    Name = "demo-ec2-instance"
  }
}

variable subnet_id {
  description = "The subnet ID where the EC2 instance will be launched"
  type        = string
#  default     = "subnet-0a78aff982c3cbc41" # Example Subnet ID, replace with your own
}

variable vpc_security_group_ids {
  description = "The security group ID to associate with the EC2 instance"
  type        = list(string)
 # default     = ["sg-0d0cc025e6041accd"] # Example Security Group ID, replace with your own
}

variable key_name {
  description = "The name of the SSH key pair to use for the EC2 instance"
  type        = string
 # default     = "demo-ssh-key" # Example SSH Key Name, replace with your own
}