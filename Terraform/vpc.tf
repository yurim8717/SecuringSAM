# create a VPC
resource "aws_vpc" "vpc-staging" {
  cidr_block       = var.vpc_cidr
  tags = {
    Name = "vpc-staging"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.vpc-staging.id
  tags = {
    Name = "main"
  }
}

# creates a public subnet called public
resource "aws_subnet" "public" {
  count = length(var.subnets_cidr)
  vpc_id = "${aws_vpc.vpc-staging.id}"
  cidr_block = element(var.subnets_cidr,count.index)
  availability_zone = element(var.azs,count.index)
#creates a public ip
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet-${count.index+1}"
  }
}

#creates a private subnet called private
resource “aws_subnet” “private” {
    vpc_id = “${aws_vpc.vpc-staging.id}”
    cidr_block = “10.0.2.0/24”
    availability_zone = “eu-west-2a”
    tags {
        Name = "private”
    }
}

# route table attached to Internet Gateway for public subnet
resource "aws_route_table" "route_public" {
  vpc_id = aws_vpc.vpc-staging.id
  route {
#accessible from internet
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_igw.id
  }
  tags = {
    Name = "Route Table for Public Subnet"
  }
}

#create route table for private network
resource "aws_route_table" "route_private" {
    vpc_id = aws_vpc.vpc-staging.id
    route {
#accessible from internet only from designated static ip (static office ip for example: 62.90.202.101/32)
    cidr_block = "62.90.202.101/32"
    gateway_id = aws_internet_gateway.vpc_igw.id
    }
    tags = {
        Name = "Route Table for Private Subnet"
    }
}

#associate route table with public subnet that is exposed to internet with port 80
resource "aws_route_table_association" "route_public" {
  count = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.public.*.id,count.index)
  route_table_id = aws_route_table.route_public.id
}

#associate route table to private subnet only from designated static ip without exposing it to internet
resource "aws_route_table_association" "route_private" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.route_private.id
}