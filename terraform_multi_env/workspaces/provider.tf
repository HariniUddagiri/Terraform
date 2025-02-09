terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


backend "s3"{
  bucket = "82shari-bucketterraform-prt-prod"
  key = "expense-terrahari-backend-storageprod"
  dynamodb_table = "my-terrahariprod-lock"
  region = "us-east-1"
  
}
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

