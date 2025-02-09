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

variable "public_subnet" {
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_subnet_cidr" {
  default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "Database_cidr" {
  default = ["10.0.21.0/24","10.0.22.0/24"]
}

variable "is_peering" {
  default = true
  
}