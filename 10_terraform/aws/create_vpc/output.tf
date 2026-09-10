output "demo_vpc_id" {
  description = "The ID of the demo VPC"
  value       = aws_vpc.demo_main.id
}

output "demo_subnet_id" {
  description = "The ID of the demo subnet"
  value       = aws_subnet.demo_subnet.id
}

output "demo_internet_gateway_id" {
  description = "The ID of the demo internet gateway"
  value       = aws_internet_gateway.demo_gateway.id
}

output "demo_route_table_id" {
  description = "The ID of the demo route table"
  value       = aws_route_table.demo_route_table.id
}