output "sg_ids" {
  description = "All security group IDs created by the module"
  value       = module.sg.sg_ids
}

output "sg_details" {
  description = "Full details for each security group"
  value       = module.sg.sg_details
}

output "ssh_sg_id" {
  value = module.sg.sg_ids["ssh_sg"]
}

output "rds_sg_id" {
  value = module.sg.sg_ids["rds_sg"]
}

output "playwright_sg_id" {
  value = module.sg.sg_ids["playwright_sg"]
}