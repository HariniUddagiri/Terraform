variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  default = true
}
#mandatory
variable "commontags" {
  #default = {} #if you give as empty without giving default, it will take as mandatory
}
#optional
variable "vpc_tags" {
  default = {} 
}

variable "project" {
 
}

variable "environment" {
  
}

