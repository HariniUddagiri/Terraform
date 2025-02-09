resource "aws_instance" "instance" {
  ami = var.ami_id
  instance_type =var.Environment=="prod"? "t3.micro" : "t2.micro"
  tags= var.ec2_tags
}

resource "aws_security_group" "allow_all" {
  name= "securiy"
  description= "Allow-all"

  ingress{
  from_port = var.from_port
  to_port = var.to_port
  protocol = "tcp"
  cidr_blocks = var.cidr_blocks
  }

  egress {
  from_port=0
  to_port=0
  protocol="-1"
  cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = var.sg_tags
  }