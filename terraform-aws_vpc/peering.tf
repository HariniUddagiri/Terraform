resource "aws_vpc_peering_connection" "default" {
    count=var.is_peering?1:0
  
  peer_vpc_id   = local.default_vpc_id #acceptor
  vpc_id        = aws_vpc.this.id #requestor
  auto_accept   = true

  tags = {
    Name = "VPC Peering between default and expense vpc "
  }
}

resource "aws_route" "public_peering" {
  count = var.is_peering?1:0
  route_table_id = aws_route_table.publicroute.id
  destination_cidr_block = local.default_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id

}

resource "aws_route" "private_peering" {
  count = var.is_peering?1:0
  route_table_id = aws_route_table.privateroute.id
  destination_cidr_block = local.default_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id
}

resource "aws_route" "Database_peering" {
  count = var.is_peering?1:0
  route_table_id = aws_route_table.Dbroute.id
  destination_cidr_block = local.default_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id
}

resource "aws_route" "default_peering" {
  count = var.is_peering?1:0
  route_table_id = data.aws_route_table.main.id
  destination_cidr_block = var.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id
}