terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


/*terraform {
  backend "s3" {
    bucket         = "82s-bucketterraform-prt"
    key            = "vpc-test-pro"
    region         = "us-east-1"
    dynamodb_table = "my-terra-lock"
  }
}*/

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

