# Generate a new RSA private key
resource "tls_private_key" "demo_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create an AWS key pair using the generated public key
resource "aws_key_pair" "demo_ssh_key_pair" {
  key_name   = var.demo_key_name
  public_key = tls_private_key.demo_ssh_key.public_key_openssh
  tags = {
    Name = var.demo_key_name
  }
}

# Save the private key to a local file with correct permissions
resource "local_file" "private_key" {
  content         = tls_private_key.demo_ssh_key.private_key_pem
  filename        = "${path.module}/demo-ssh-key.pem"
  file_permission = "0600" # Important for SSH to work
}