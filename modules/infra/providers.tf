terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
	mysql = {
      source  = "terraform-providers/mysql"
      version = ">= 1.10.6"
    }
  }
}
