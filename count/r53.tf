resource "aws_route53_record" "roboshop_r53" {
  count   = length(var.instances) #insted of value used legth function
  zone_id = var.zone_id
  #interpolation
  name            = "${var.instances[count.index]}.${var.domain_name}" #mongodb.cloudkarna.in
  type            = "A"
  ttl             = 1
  records         = [aws_instance.roboshop_instance[count.index].private_ip]
  allow_overwrite = true # it will overwrite te existing records
}

#roboshop.cloudkarna.in -> public ip
# Here we are using index fuction
# you need public id also right for frontend
resource "aws_route53_record" "roboshop_frontend_r53" {
  count   = length(var.instances) #insted of value used legth function
  zone_id = var.zone_id
  #interpolation
  name            = "roboshop.${var.domain_name}" #roboshop.cloudkarna.in
  type            = "A"
  ttl             = 1
  records         = [aws_instance.roboshop_instance[index(var.instances, "frontend")].public_ip] #index(list, value) you know list = var.instances & value = frontend 
  allow_overwrite = true                                                                         # it will overwrite te existing records
}

