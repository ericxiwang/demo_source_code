

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
  vpc_id        = module.create_vpc.demo_vpc_id != "" ? module.create_vpc.demo_vpc_id : data.aws_vpc.default.id
  #vpc_id        = var.vpc_id != "" ? var.vpc_id : data.aws_vpc.default.id
  demo_sg_list  = var.demo_sg_list
  allowed_cidr  = "0.0.0.0/0"
  tags          = var.common_tags
}

# -----------------------------------------------------------------
# Example: use the module outputs in another resource
# -----------------------------------------------------------------




module "create_keys" {
  source = "./create_keys"
 # key_name = var.demo_key_name
}


module "create_ec2" {
  source = "./ec2"
  subnet_id = module.create_vpc.demo_subnet_id != "" ? module.create_vpc.demo_subnet_id : data.aws_vpc.default.id
  vpc_security_group_ids = module.sg.ssh_sg_id != "" ? [module.sg.ssh_sg_id] : []
  key_name = module.create_keys.demo_ssh_key_name
}