
# -----------------------------
# Security Group (allow SSH)
# -----------------------------
resource "aws_security_group" "ssh_sg" {
  name        = var.ssh_sg_name
  description = "Allow SSH inbound"
  # SSH Access
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
  tags = {
    Name = "allow-ssh"
  }
}


# -----------------------------
# Security Group (allow playwright access)
# -----------------------------
resource "aws_security_group" "playwright_sg" {
  name        = var.playwright_sg_name
  description = "Allow Playwright inbound"


   # Playwright Server Access (e.g., for browserless)
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-playwright"
  }
}