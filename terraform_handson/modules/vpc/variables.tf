variable "region" {
  type = string
  description = "Define the aws region"
  default = "eu-central-1"
}

variable "az1" {
  type = string
  description = "Define the aws Availability zone"
  default = "eu-central-1a"
}

variable "az2" {
  type = string
  description = "Define the aws Availability zone"
  default = "eu-central-1b"
}

variable "aws_vpc_name" {
  type = string
  description = "Define the vpc name"
  #default = "example_vpc"
}

variable "cidr_block_vpc" {
  type = string
  description = "Define the vpc cidr block"
  default = "10.0.0.0/16"
}

variable "instance_tenancy" {
  type = string
  default = "default"
}

variable "cidr_block_pub_subnet1" {
  type = string
  default = "10.0.1.0/24"
}

variable "name_pub_subnet1" {
  type = string
  default = "public-subnet-1"
}

variable "cidr_block_pub_subnet2" {
  type = string
  default = "10.0.3.0/24"
}

variable "name_pub_subnet2" {
  type = string
  default = "public-subnet-2"
}

variable "name_igw" {
  type = string
  default = "internet-gateway"
}

variable "cidr_block_rtb" {
  type = string
  default = "0.0.0.0/0"
}

variable "rtb_name" {
  type = string
  default = "example_rtb"
}