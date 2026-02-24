resource "aws_route53_record" "roboshop" {
  count   = 10
  zone_id = var.zone_id
  #interpolation
  name    = "${var.instances[count.index]}.${var.domain_name}"  #mongodb.cloudkarna.in
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop_instance[count.index].private_ip]
}
