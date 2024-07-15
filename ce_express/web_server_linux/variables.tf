variable "region" {
  default = "us-west-2"
}

variable "tags" {
  description = "Tags to propogate to all supported resources"
  type        = map(string)

  default = {
    ManagedBy = "terraform"
  }
}

variable "name" {
  type    = string
  default = "webserver"
}

variable "volume_size" {
  description = "Size of root EBS volume of the container instance"
  default     = "8"
}

variable "s3_apache_logs" {
  description = "Name of S3 Bucket Logs"
  default     = "onica-task-apache-logs"
}
