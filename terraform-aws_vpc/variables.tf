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
  #default = {} 
}

variable "project" {
 
}

variable "environment" {
  
}
variable "igwtags" {
  default = {}
}

variable "public_subnet_tags" {
  default = {}
}

variable "public_subnet" {
  type=list
  validation {
    condition = length(var.public_subnet)==2
    error_message = "Please pass vlaid 2 cidr's"
  }
}

variable "private_subnet_cidr" {
  type=list
  validation {
    condition = length(var.private_subnet_cidr)==2
    error_message = "please pass valid 2 cidr's"
  }
}

variable "private_subnet_cidr_tags" {
  default = {}
}

variable "Database_cidr" {
 type = list
 validation {
   condition = length(var.Database_cidr)==2
   error_message="Please pass valid 2 cidrs"
 }
}

variable "Database_cidrtags" {
  default={}
}

variable "puroute_tags" {
  default = {}
}

variable "prroute_tags" {
  default = {}
}
variable "Dbroutetags" {
  default = {}
}

variable "is_peering"{
default=false
}