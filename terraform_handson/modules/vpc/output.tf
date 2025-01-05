output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "pub_subnet_1_id" {
  value = aws_subnet.public-subnet-1.id
}

output "pub_subnet_2_id" {
  value = aws_subnet.public-subnet-2.id
}
