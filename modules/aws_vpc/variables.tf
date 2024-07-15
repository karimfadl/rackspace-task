variable "tags" {
  description = "tags to propogate to all supported resources"
  type        = map(string)
}

variable "az_count" {
  description = "the number of AZs to deploy infrastructure to"
  default     = 2
}

variable "aws_region" {
  description = "The AWS region to deploy into (e.g. ca-central-1)."
  default     = "ca-central-1"
}

variable "vpc_name" {
  description = "name of the VPC to create"
}

variable "vpc_cidr" {
  description = "CIDR associated with the VPC to be created"
  default     = "10.1.0.0/16"
}

variable "private_subnet_size" {
  default = 24
}

variable "public_subnet_size" {
  default = 26
}

variable "enable_public_subnets" {
  type    = string
  default = "true"
}

variable "enable_private_subnets" {
  type    = string
  default = "true"
}

