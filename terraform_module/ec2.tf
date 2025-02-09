module "ec2" {
  source = "../terraform-aws-ec2"
  instance_type = "t2.micro"
}