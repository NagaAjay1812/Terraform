variable "ingress_rules" {
  type = list(any)
  default = [
    {
      from_port   = "22"
      to_port     = "22"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #if you want to allow specific ip address you can keep it here
      description = "allowing port 22 from internet"
    },
    {
      from_port   = "443"
      to_port     = "443"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #if you want to allow specific ip address you can keep it here
      description = "allowing port 443 from internet"
    },
    {
      from_port   = "3306"
      to_port     = "3306"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #if you want to allow specific ip address you can keep it here
      description = "allowing port 3306 from internet"
    }
  ]
}