resource "aws_instance" "instance" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    Name    = "Tpractice"
    Purpose = "explore"
  }
}

resource "aws_security_group" "allow_all"{
    name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  # We would need to declare ingress for 3 servers for our project, instead of writing ingress block , 3 times for different firewalls, we can use dynamic blocks and iterate
  dynamic ingress {
    for_each = var.ingress_ports
    content {
    from_port   = ingress.value["from_port"]
    to_port     = ingress.value["to_port"]
    protocol    = ingress.value["protocol"]
    cidr_blocks = ingress.value["cidr_blocks"]
    }
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