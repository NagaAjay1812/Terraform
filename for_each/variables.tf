#map
# variable "instances"{
#     type = map
#     default = {
#         "mongodb" = "t3.micro",
#         "mysql"= "t3.small"
#     }
# }
# set
variable "instances" {
  type    = list
  default = ["mongodb", "mysql"]
}

variable "zone_id"{
    default = "Z07326442Z8C3IRLJ3030"
}

variable "domain_name"{
    default = "cloudkarna.in"
}