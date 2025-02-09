variable "instance_type" {
  default = {
    mysql="t2.micro"
    backend="t3.micro"
    frontend="t3.micro"
  }
}

variable "zone_id" {
  default = "Z10232423FVKYCFNEYN3P"
}

variable "domainname" {
  default = "daws82s.store"
}