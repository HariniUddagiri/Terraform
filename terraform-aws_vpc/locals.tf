locals {
  resource="${var.project}-${var.environment}"
  az_names=slice(data.aws_availability_zones.az.names,0,2)
  default_vpc_id=data.aws_vpc.default.id
  default_vpc_cidr_block=data.aws_vpc.default.cidr_block
}