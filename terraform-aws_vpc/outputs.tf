output "az_info" {
  value = data.aws_availability_zones.az
}

output "subnets_info" {
  value=aws_subnet.public
}

output "vpc_id" {
  value = aws_vpc.this.id
}