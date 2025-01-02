variable "environment" {
  description = "The environment to configure (dev or prod)"
  type        = string
}

variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID to attach to the instance"
  type        = string
}

variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
}