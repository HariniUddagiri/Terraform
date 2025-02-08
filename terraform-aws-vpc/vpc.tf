module "vpc" {
  source = "../vpc-module_necessaries"
  project = var.project
  environment = var.environment
  commontags = var.commontags
  vpc_tags = var.vpc_tags
}