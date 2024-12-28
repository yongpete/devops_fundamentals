resource "aws_eip" "nat_elsatic_ip_1" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_eip" "nat_elsatic_ip_2" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.az1
  cidr_block = var.cidr_block_priv_subnet1
  map_public_ip_on_launch = false
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.az2
  cidr_block = var.cidr_block_priv_subnet2
  map_public_ip_on_launch = false
}

resource "aws_nat_gateway" "nat_gateway_A" {
  allocation_id = aws_eip.nat_elsatic_ip_1.id
  subnet_id     = aws_subnet.public-subnet-1.id
  tags = {
    Name = var.nat_gateway_A_name
  }
}

resource "aws_nat_gateway" "nat_gateway_B" {
  allocation_id = aws_eip.nat_elsatic_ip_2.id
  subnet_id     = aws_subnet.public-subnet-2.id
  tags = {
    Name = var.nat_gateway_B_name
  }
}

resource "aws_route_table" "private_rt_1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.cidr_rt_1
    nat_gateway_id = aws_nat_gateway.nat_gateway_A.id
  }
}

resource "aws_route_table" "private_rt_2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.cidr_rt_2
    nat_gateway_id = aws_nat_gateway.nat_gateway_B.id
  }
}

resource "aws_route_table_association" "associate_private_A" {
  route_table_id = aws_route_table.private_rt_1.id
  subnet_id = aws_subnet.private-subnet-1.id
}

resource "aws_route_table_association" "associate_private_B" {
  route_table_id = aws_route_table.private_rt_2.id
  subnet_id = aws_subnet.private-subnet-2.id
}