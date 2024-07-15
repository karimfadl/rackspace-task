## module: vpc_igw

variable "vpc_id" {
}

variable "tags" {
  type    = map(string)
  default = {}
}

