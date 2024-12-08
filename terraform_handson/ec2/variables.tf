variable "role_name" {
  type = string
  default = "ec2-s3-access-role"
}
variable "policy_name" {
  type = string
  default = "ec2-s3-access-policy"
}
variable "instance_profile_name" {
  type = string
  default = "ec2-instance-profile"
}
variable "ami" {
  type = string
  default = "ami-0b5673b5f6e8f7fa7"
}
variable "instance_name" {
  type = string
  default = "EC2InstanceWithRole"
}