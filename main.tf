resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "production-vpc"
  }
}

data "aws_availability_zones" "azs" {
  state = "available"
}

resource "aws_subnet" "public-1a" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = data.aws_availability_zones.azs.names[0]
  map_public_ip_on_launch = true
  cidr_block              = "10.0.0.0/26"

  tags = {
    Name = "public-production-1a"
  }
}

resource "aws_subnet" "public-1b" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = data.aws_availability_zones.azs.names[1]
  map_public_ip_on_launch = true
  cidr_block              = "10.0.0.64/26"

  tags = {
    Name = "public-production-1b"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "production-igw"
  }
}

resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "production-rtb"
  }
}

resource "aws_route_table_association" "public-1a-rtb" {
  subnet_id      = aws_subnet.public-1a.id
  route_table_id = aws_route_table.rtb.id
}

resource "aws_route_table_association" "public-1b-rtb" {
  subnet_id      = aws_subnet.public-1b.id
  route_table_id = aws_route_table.rtb.id
}