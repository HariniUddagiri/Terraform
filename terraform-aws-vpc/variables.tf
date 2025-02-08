variable "project" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "commontags" {
  default = {
    Project="expense"
    Environment="dev"
    terraform=true
  }
}

variable "vpc_tags" {
  default = {
    purpose="practice"
  }
}