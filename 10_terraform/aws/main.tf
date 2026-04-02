provider "aws" {
  region = var.aws_region
}

#module "rds" {
#  source = "./rds"
#  rds_region = var.aws_region
#}
module "sg" {
  source = "./sg"
  ssh_sg_name = var.ssh_sg_name
  playwright_sg_name = var.playwright_sg_name
}




########################################################################################
# -----------------------------
# EC2 Instance (Ubuntu 22.04) -- Jenkins Server
# -----------------------------

resource "aws_instance" "jenkins-server" {

  depends_on = [module.sg] # Ensure security groups are created before EC2 instances
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name               = var.ec2-sshkey
  #vpc_security_group_ids = [aws_security_group.ssh_sg.id]

  vpc_security_group_ids = [module.sg.ssh_sg_id]


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


# -----------------------------
# EC2 Instance (Ubuntu 22.04) --  Playwright Server
# -----------------------------
resource "aws_instance" "playwright-server" {

  depends_on = [module.sg] # Ensure security groups are created before EC2 instances
  ami           = var.instance_ami

  instance_type = var.instance_type


  key_name               = var.ec2-sshkey
  #vpc_security_group_ids = [module.sg.ssh_sg.id, module.sg.playwright_sg.id]
  vpc_security_group_ids = [module.sg.ssh_sg_id, module.sg.playwright_sg_id]

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
