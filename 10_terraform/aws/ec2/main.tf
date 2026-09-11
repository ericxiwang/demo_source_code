resource "aws_instance" "demo_ec2" {
  ami           = var.ec2_config.ami
  instance_type = var.ec2_config.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name     = var.key_name
  
  root_block_device {
    volume_size = 20   
    volume_type = "gp3" 
  }
  tags ={
    Name = var.ec2_tags["Name"]
  }
}

