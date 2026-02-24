resource "aws_instance" "roboshop_instance" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  # Reference the security group ID here
  vpc_security_group_ids = [aws_security_group.Security_groups.id]

  # Optional: Add tags to the instance for identification
  tags = {
    Name    = "terraform"
    Project = "Roboshop"



  }
}


resource "aws_security_group" "Security_groups" {
  name        = "terraform_testing_sg" # this is for AWS account
  description = "Allow TLS inbound traffic"

  # I want to open multiple ports

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }

  tags = {
    Name = "terraform_testing_sg"
  }
}
