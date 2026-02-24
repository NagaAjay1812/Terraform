resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.roboshop_instance
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #mongodb.cloudkarna.in
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
  allow_overwrite = true # it will overwrite te existing records
}

resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.roboshop_instance
  zone_id = var.zone_id
  name    = "roboshop.${var.domain_name}" #roboshop.cloudkarna.in
  type    = "A"
  ttl     = 1
  records = [lookup(aws_instance.roboshop_instance, "frontend").public_ip] #The lookup function returns the value for the given key if it exists; otherwise, it returns the default value
  allow_overwrite = true # it will overwrite te existing records
}

