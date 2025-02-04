resource "aws_route53_record" "example" {
  count = length(var.instances)
  allow_overwrite = true
  name            = var.instances[count.index]=="frontend" && var.environment=="prod"?"${var.instances[count.index]}.${var.domainname}":"${var.instances[count.index]}-${var.environment}.${var.domainname}" #Interpolation
  ttl             = 1
  type            = "A"
  zone_id         = var.zone_id

  records = [var.instances[count.index]=="frontend" && var.environment=="prod"?aws_instance.ec2[count.index].public_ip:aws_instance.ec2[count.index].private_ip] #list type
}

resource "aws_route53_record" "frontend" {
  count = length(var.instances)
  allow_overwrite = true
  name            = var.domainname 
  ttl             = 1
  type            = "A"
  zone_id         = var.zone_id

  records = [aws_instance.ec2[2].public_ip] #list type
}