variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "instances"{
    default = ["mysql","backend","frontend"]
}
variable "instance_type" {
  default = "t2.micro"
}

variable "ec2_tags" {
  default = {
  Project="expense"
  Component="Backend"
  
  }
}

variable "from_port" {
  default=22
}

variable "to_port" {
  default=22
}

variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  default = {
  Name="allow-all"
  }
}

variable "zone_id" {
  default = "Z10232423FVKYCFNEYN3P"
}

variable "domainname" {
  default = "daws82s.store"
}