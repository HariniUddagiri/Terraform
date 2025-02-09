locals {
  ami_id=data.aws_ami.devops.id 
  instance_type_local="t2.micro"
  name="${var.project}-${var.component}-${var.Environment}" #local are able to refer variables
}