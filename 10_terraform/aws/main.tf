

provider "aws" {
  region = var.aws_region
}

# -----------------------------------------------------------------
# Reference existing VPC (or use your own data source / resource)
# -----------------------------------------------------------------
data "aws_vpc" "default" {
  default = true
}

module "create_vpc" {
  source = "./create_vpc"

  #demo_cidr_block          = var.demo_cidr_block
  #demo_availability_zone   = var.demo_availability_zone
  #common_tags              = var.common_tags
}

# -----------------------------------------------------------------
# Call the security_groups module
# -----------------------------------------------------------------
module "sg" {
  source = "./sg"

  vpc_id        = var.vpc_id != "" ? var.vpc_id : data.aws_vpc.default.id
  demo_sg_list  = var.demo_sg_list
  allowed_cidr  = "0.0.0.0/0"
  tags          = var.common_tags
}

# -----------------------------------------------------------------
# Example: use the module outputs in another resource
# -----------------------------------------------------------------
