terraform {
  required_version =">= 1.0.9" # see https://releases.hashicorp.com/terraform/ 
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = var.region
}