output "sg_ids" {
  description = "Map of SG name to its ID"
  value       = { for k, sg in aws_security_group.demo : k => sg.id }
}

output "sg_arns" {
  description = "Map of SG name to its ARN"
  value       = { for k, sg in aws_security_group.demo : k => sg.arn }
}

output "sg_details" {
  description = "Detailed info for each security group"
  value = {
    for k, sg in aws_security_group.demo : k => {
      id   = sg.id
      arn  = sg.arn
      name = sg.name
      port = var.demo_sg_list[k]
    }
  }
}

output "ssh_sg_id"        { value = aws_security_group.demo["ssh_sg"].id }
output "playwright_sg_id" { value = aws_security_group.demo["playwright_sg"].id }
output "rds_sg_id"        { value = aws_security_group.demo["rds_sg"].id }