output "ssh_sg_id" {
  value = aws_security_group.ssh_sg.id
}
output "playwright_sg_id" {
  value = aws_security_group.playwright_sg.id
}