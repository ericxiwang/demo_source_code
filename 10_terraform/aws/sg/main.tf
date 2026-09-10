resource "aws_security_group" "demo" {
  for_each = var.demo_sg_list

  name        = each.key
  description = "Security group for ${each.key} on port ${each.value}"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow port ${each.value}"
    from_port   = tonumber(each.value)
    to_port     = tonumber(each.value)
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = each.key })
}