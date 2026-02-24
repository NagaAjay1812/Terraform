variable "instances" {
  type    = list(any)
  default = ["mongodb", "catalogue", "redis", "user", "cart", "mysql", "shipping", "rabbitmq", "payment", "frontend"]
}

variable "zone_id" {
  default = "Z07326442Z8C3IRLJ3030"
}

variable "domain_name" {
  default = "cloudkarna.in"
}


