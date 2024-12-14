module "ec2_module" {
  source = "./module/ec2"
  instance_name = var.instance_name
  role_name = var.role_name
  policy_name = var.policy_name
  instance_type = var.instance_type
  instance_profile_name = var.instance_profile_name
}