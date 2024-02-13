# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "<= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    encrypt        = true
    bucket         = "devops-backend-tfstate"
    dynamodb_table = "devops-state-locking"
    key            = "devops-state.tfstate"
    region         = "us-east-1"
  }
}
