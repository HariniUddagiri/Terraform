terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


terraform {
  backend "s3" {
    bucket         = "82s-bucketterraform-prt"
    key            = "expense-terra-backend-storage"
    region         = "us-east-1"
    dynamodb_table = "my-terra-lock"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

