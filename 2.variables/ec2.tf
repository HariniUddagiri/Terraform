resource "aws_instance" "ec2" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = var.ec2_tags
}

resource "aws_security_group" "sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
  from_port = var.from_port
  to_port = var.to_port
  protocol="tcp"
  cidr_blocks = var.cidr_blocks
}

egress{
from_port=0
to_port=0
protocol="-1"
cidr_blocks=["0.0.0.0/0"]
}

tags=var.sg_tags

}