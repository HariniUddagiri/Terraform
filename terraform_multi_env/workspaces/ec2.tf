resource "aws_instance" "instance" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = lookup(var.instance_type,terraform.workspace,"t3.small")
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    Name    = "terraform-${terraform.workspace}"
    
  }
}

resource "aws_security_group" "allow_all"{
    name        = "allow_tls-${terraform.workspace}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }

}