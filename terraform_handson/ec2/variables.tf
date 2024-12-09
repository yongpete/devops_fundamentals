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
