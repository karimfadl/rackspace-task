variable "ami_name_filter" {
  type        = string
  description = "define a filter for selecting an AMI"
  default     = "amzn-ami-hvm-"
}

variable "ami_additional_regex" {
  description = "Additional regex to add to the end of a filter."
  default     = "-x86_64-gp2"
}

variable "ami_owner" {
  type        = string
  description = "Defines the owner of an AMI"
  default     = "amazon"
}

variable "name" {
  type        = string
  description = "EC2 Instance Name"
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to apply to supported resources"
}

variable "subnet_id" {
  type        = string
  description = "subnet_id to deploy the ECE Instance"
}

variable "subnet_ids" {
  description = "A list of VPC Subnet IDs to launch in"
  default     = []
  type        = list(string)
}

variable "key_name" {
  type        = string
  description = "Name of the SSH key to deploy EC2 Instance"
}

variable "instance_size" {
  type        = string
  description = "Instance Size"
  default     = "t2.large"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of security groups"
}

variable "monitoring" {
  type        = string
  description = "Boolean enabling advanced cloudwatch metrics"
  default     = "false"
}

variable "root_volume_size" {
  type        = string
  description = "The size of the volume in gigabytes."
  default     = 30
}

variable "root_volume_type" {
  type        = string
  description = "The type of volume. Can be standard, gp2, or io1. (Default: standard)."
  default     = "gp2"
}

variable "root_delete_on_termination" {
  type        = string
  description = "Whether the volume should be destroyed on instance termination (Default: true)."
  default     = "true"
}

variable "instance_prevent_destroy" {
  type        = string
  description = "Instance can be destroyed or not (Default: false)."
  default     = "false"
}

variable "ebs_optimized" {
  type        = string
  description = "EBS optimization flag"
  default     = "true"
}

variable "user_data" {
  type        = string
  description = "User data to execute on the ec2 instance"
  default     = ""
}

variable "use_num_suffix" {
  description = "Always append numerical suffix to instance name, even if instance_count is 1"
  default     = "false"
}

variable "instance_count" {
  default = "1"
}

