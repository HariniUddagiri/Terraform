variable "project" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "commontags" {
default = {
  Name="expense"
  environment="dev"
  Terraform="true"
  }
}