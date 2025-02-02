resource "aws_instance" "instance" {
  ami           =  local.ami_id #data.aws_ami.devops.id (storing this big expreesion with name ami_id using locals, so in main code, we can simplified name) 
  instance_type =  local.instance_type_local #(variables can be overridden, so we are storing instance type value in local and putting that name here, so that it can't be overridden by anyone/anything)
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    Name    = local.name
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