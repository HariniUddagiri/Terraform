resource "aws_vpc" "this" {
  instance_tenancy = "default"
  cidr_block = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge ( var.commontags, {
    Name=local.resource
  }, var.vpc_tags)
}