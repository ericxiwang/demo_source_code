resource "aws_vpc" "demo_main" {
  cidr_block           = var.demo_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "demo-vpc"
  }
}

resource "aws_subnet" "demo_subnet_1" {

  vpc_id                  = aws_vpc.demo_main.id
  cidr_block              = var.demo_subnet_cidr_block_1
  availability_zone       = var.demo_availability_zone_1 # Change to your desired AZ
  map_public_ip_on_launch = true

  tags = {
    Name = "demo-subnet-1"
  }
}

resource "aws_subnet" "demo_subnet_2" {

  vpc_id                  = aws_vpc.demo_main.id
  cidr_block              = var.demo_subnet_cidr_block_2
  availability_zone       = var.demo_availability_zone_2 # Change to your desired AZ
  map_public_ip_on_launch = true

  tags = {
    Name = "demo-subnet-2"
  }
}


resource "aws_internet_gateway" "demo_gateway" {
  vpc_id = aws_vpc.demo_main.id

  tags = {
    Name = "demo-gateway"
  }
}


resource "aws_route_table" "demo_route_table" {
  vpc_id = aws_vpc.demo_main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_gateway.id
  }
}


resource "aws_route_table_association" "demo_route_table_assoc_1" {
  subnet_id      = aws_subnet.demo_subnet_1.id
  route_table_id = aws_route_table.demo_route_table.id
}

resource "aws_route_table_association" "demo_route_table_assoc_2" {
  subnet_id      = aws_subnet.demo_subnet_2.id
  route_table_id = aws_route_table.demo_route_table.id
}