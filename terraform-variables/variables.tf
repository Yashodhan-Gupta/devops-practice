variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  type        = string
}

variable "subnet_az" {
  description = "Availability zone for subnet"
  type        = string
}

variable "subnet_name" {
  description = "Name tag for subnet"
  type        = string
}

variable "igw_name" {
  description = "Name tag for internet gateway"
  type        = string
}

variable "route_table_name" {
  description = "Name tag for route table"
  type        = string
}

variable "destination_cidr" {
  description = "Destination CIDR block for internet route"
  type        = string
}

variable "security_group_name" {
  description = "Security group name"
  type        = string
}

variable "security_group_description" {
  description = "Security group description"
  type        = string
}

variable "ssh_port" {
  description = "SSH port"
  type        = number
}

variable "http_port" {
  description = "HTTP port"
  type        = number
}

variable "allowed_cidr" {
  description = "Allowed CIDR block for inbound access"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_name" {
  description = "Name tag for EC2 instance"
  type        = string
}
