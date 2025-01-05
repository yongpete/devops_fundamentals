output "instance_public_ip" {
  value       = module.ec2_module.instance_public_ip
  description = "The public IP address of the EC2 instance"
}

output "vpc_id" {
  value = module.vpc_module.vpc_id
}

output "pub_subnet_1_id" {
  value = module.vpc_module.pub_subnet_1_id
}

output "pub_subnet_2_id" {
  value = module.vpc_module.pub_subnet_2_id
}