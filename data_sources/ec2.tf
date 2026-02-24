resource "aws_instance" "roboshop_instance" {
  ami           = data.aws_ami.roboshop.id # This dynamically fetches the latest AMI from AWS. If the AMI version changes, Terraform automatically uses the updated one.
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
