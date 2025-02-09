resource "aws_instance" "instance" {
  ami           = data.aws_ami.devops.id  #"ami-09c813fb71547fc4f"
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