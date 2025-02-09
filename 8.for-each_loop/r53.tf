resource "aws_route53_record" "example" {
  for_each = aws_instance.instance
  allow_overwrite = true
  name            = each.key=="frontend"?var.domainname:"${each.key}.${var.domainname}" #Interpolation
  ttl             = 1
  type            = "A"
  zone_id         = var.zone_id

  records = each.key=="frontend"?[each.value.private_ip]:[each.value.public_ip] #list type
}

