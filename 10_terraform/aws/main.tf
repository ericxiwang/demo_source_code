provider "aws" {
  region = "us-east-1"
}



# -----------------------------
# Security Group (allow SSH)
# -----------------------------
resource "aws_security_group" "demo1_sg" {
  name        = "demo1-sg"
  description = "Allow SSH inbound"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# -----------------------------
# EC2 Instance (Ubuntu 22.04)
# -----------------------------
resource "aws_instance" "demo1" {
  ami           = "ami-0c398cb65a93047f2" # Ubuntu 22.04 LTS (us-east-1)
  instance_type = "t2.micro"

  key_name               = "demo1"
  vpc_security_group_ids = [aws_security_group.demo1_sg.id]

  # -------------------------
  # Root EBS volume config
  # -------------------------
  root_block_device {
    volume_size = 8 # GB
    volume_type = "gp3"
    encrypted   = false
  }



  tags = {
    Name = "demo1"
  }
}
