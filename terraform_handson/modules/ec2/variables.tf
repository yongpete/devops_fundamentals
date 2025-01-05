variable "role_name" {
  type = string
  description = "IAM role name" 
}
variable "policy_name" {
  type = string
  description = "IAM policy name"
}
variable "instance_profile_name" {
  type = string
  description = "EC2 instance profile name"
}
variable "instance_name" {
  type = string
  description = "EC2 Instance name"
}

variable "instance_type" {
  type = string
  description = "EC2 Instance type"
}

variable "assume_role_policy" {
  type = string
  description = "Define who can use the permissions"
  default = null
}

variable "key_name" {
  description = "key-pair name"
}

variable "aws_iam_role_policy" {
  type = string
  description = "Define the inline policy"
  default = null
}

variable "policy_arn" {
  type = string
  description = "AWS managed policy attachment to an iam role"
  default = null
}

variable "vpc_id" {
  type = string
  description = "VPC id"
}

variable "pub_subnet_1_id" {
  type = string
}
