resource "aws_vpc_peering_connection" "default" {
    count=var.is_peering?1:0
  
  peer_vpc_id   = local.default_vpc_id #acceptor
  vpc_id        = aws_vpc.this.id #requestor
  auto_accept   = true

  tags = {
    Name = "VPC Peering between default and expense vpc "
  }
}