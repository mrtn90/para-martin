resource "aws_vpc" "vpc-p6" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "terraform-vpc-p6"
  }
}

resource "aws_subnet" "p6-public-subnet" {
  vpc_id                  = aws_vpc.vpc-p6.id
  cidr_block              = var.public_subnet
  availability_zone       = var.vpc_aws_az
  map_public_ip_on_launch = "true"
  tags = {
    Name = "terraform-p6-public-subnet"
  }
}

resource "aws_subnet" "p6-private-subnet-2" {
  vpc_id                  = aws_vpc.vpc-p6.id
  cidr_block              = var.public_subnet-2
  availability_zone       = var.vpc_aws_az-2
  map_public_ip_on_launch = "true"
  tags = {
    Name = "terraform-p6-public-subnet-2"
  }
}
resource "aws_internet_gateway" "p6-gw" {
  vpc_id = aws_vpc.vpc-p6.id
  tags = {
    Name = "terraform-p6-gw"
  }
}

resource "aws_default_route_table" "p6-route-table" {
  default_route_table_id = aws_vpc.vpc-p6.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.p6-gw.id
  }
  tags = {
    Name = "default route table"
  }
}