resource "aws_instance" "roboshop_instance" {
  for_each      = var.instances  # no need to remember for each synatx just search in google for syntax
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = each.value  # no need to remember for each synatx just search in google for syntax
  # Reference the security group ID here
  vpc_security_group_ids = [aws_security_group.Security_groups.id]

  # Optional: Add tags to the instance for identification
  tags = {
    Name    =  each.key                # no need to remember for each synatx just search in google for syntax
    Project = "Roboshop"
  }
}


resource "aws_security_group" "Security_groups" {
  name        = "terraform_testing_sg" # this is for AWS account
  description = "Allow TLS inbound traffic"
  

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
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
