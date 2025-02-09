resource "aws_ssm_parameter" "security_grp_id" {
  name  = "/${var.project}/${var.environment}/security_grp_id"
  type  = "String"
  value = module.mysql_sg.aws_security_group
}