variable "name" {
  default = "locals"
}
variable "env" {
  default = "dev"
}

variable "ec2_tags" {
  type = map(any)
  default = {

    Environment = "dev"
    project     = "roboshop"
    Terraform   = "true"
  }
}
variable "sg_tags" {
  type = map(any)
  default = {
    Environment = "dev"
    project     = "roboshop"
    Terraform   = "true"
  }
}
