
output demo_ssh_key_name {
  description = "Name of the EC2 SSH key pair"
  value       = aws_key_pair.demo_ssh_key_pair.key_name
  #value       = var.demo_key_name
}

output demo_ssh_private_key {
  description = "The private key for SSH access"
  value       = tls_private_key.demo_ssh_key.private_key_pem
}
output demo_ssh_public_key {
  description = "The public key for SSH access"
  value       = tls_private_key.demo_ssh_key.public_key_openssh
}