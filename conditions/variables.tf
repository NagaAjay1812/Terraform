
variable "environment"{
  default = "dev"    
}
variable "ami_id" {
  type        = string  #its not mandatory but it would be better if you mention in var
  default     = "ami-0220d79f3f480ecf5"
  description = "RHEL 9 image"
}
variable "ins_type" {
  type    = string
  default = "t3.micro"
}

variable "ec2_tags" {
  type = map
  default = {
    Name        = "variables_demo"
    project     = "roboshop"
    Terraform   = "True" # if someone saw this they can understand this one created through terraform
    environment = "dev"
  }
}

variable "sg_name" {
  type    = string
  default = "terraform_testing_sg"
}

variable "sg_des" {
  type    = string
  default = "Allow TLS inbound traffic"
}

variable "sg_from_port" {
  type    = number
  default = 0
}

variable "sg_to_port" {
  type    = number
  default = 0
}

variable "cidr_locks" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  type = map(any)
  default = {
    Name        = "terraform_testing_sg"
    project     = "roboshop"
    Terraform   = "True" # if someone saw this they can understand this one created through terraform
    environment = "dev"
  }

} 