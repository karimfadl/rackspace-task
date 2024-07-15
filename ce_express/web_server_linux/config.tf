terraform {
  required_version = ">= 0.12"
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = var.region
}
