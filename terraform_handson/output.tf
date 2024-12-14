output "instance_public_ip" {
  value       = module.ec2_module.instance_public_ip
  description = "The public IP address of the EC2 instance"
}