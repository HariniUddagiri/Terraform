module "mysql_sg" {
  source = "../terraform-aws-sg"
  project = var.project
  environment = var.environment
  sg_name = "mysql"
  sg_description ="Created for mysql instance of expense project"
  commontags = var.commontags
  vpc_id = data.aws_ssm_parameter.vpc_id.value

}