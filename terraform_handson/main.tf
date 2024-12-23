module "vpc_module" {
  source       = "./modules/vpc"
  aws_vpc_name = var.aws_vpc_name
}


module "ec2_module" {
  source                = "./modules/ec2"
  instance_name         = var.instance_name
  role_name             = var.role_name
  policy_name           = var.policy_name
  instance_type         = var.instance_type
  key_name              = var.key_name
  instance_profile_name = var.instance_profile_name
  vpc_id = module.vpc_module.vpc_id
  pub_subnet_1_id = module.vpc_module.pub_subnet_1_id
  policy_arn            = "arn:aws:iam::aws:policy/job-function/Billing" # Optional as default value is null
  aws_iam_role_policy   = file("s3-policy.json")
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

