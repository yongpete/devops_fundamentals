## VPC

resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block_vpc
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = var.aws_vpc_name
  }
}

###############

resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_block_pub_subnet1
  availability_zone = "${var.az1}"
  map_public_ip_on_launch = true

  tags = {
    Name = var.name_pub_subnet1
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_block_pub_subnet2
  availability_zone = "${var.az2}"
  map_public_ip_on_launch = true

  tags = {
    Name = var.name_pub_subnet2
  }
}

###############
## Internet gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.name_igw
  }
}

################
# Route Table

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.cidr_block_rtb
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.rtb_name
  }
}

###############
## Route table association

resource "aws_route_table_association" "public-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.route.id
}

resource "aws_route_table_association" "public-2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.route.id
}

###############
##############################
