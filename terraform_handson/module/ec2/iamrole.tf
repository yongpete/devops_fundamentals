# create an iam role
resource "aws_iam_role" "ec2_role" {
  name = var.role_name

  assume_role_policy = var.assume_role_policy
}

# create an iam role inline policy. The policy is read via external json file
resource "aws_iam_role_policy" "s3_policy" {
  name   = var.policy_name
  role   = aws_iam_role.ec2_role.name
  policy = var.aws_iam_role_policy
}

#  Create an EC2 Instance Profile
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.ec2_role.name
}