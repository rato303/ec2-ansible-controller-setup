variable "ami" {
  description = "The AMI to use for the dev environment"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the dev environment"
  type        = string
}

variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID for the dev environment"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for the EC2 instance"
  type        = string
}

variable "ansible_version" {
  description = "Version of ansible to install"
  type        = string
}