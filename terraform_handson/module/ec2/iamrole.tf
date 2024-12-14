# create an iam role
resource "aws_iam_role" "ec2_role" {
  name = var.role_name

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

# create an iam role inline policy. The policy is read via external json file
resource "aws_iam_role_policy" "s3_policy" {
  name   = var.policy_name
  role   = aws_iam_role.ec2_role.name
  policy = jsonencode(
    {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "s3:ListBucket",
          "s3:GetObject"
        ],
        "Resource": [
          "*"
        ]
      }
    ]
  }
  
  )
}

#  Create an EC2 Instance Profile
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.ec2_role.name
}