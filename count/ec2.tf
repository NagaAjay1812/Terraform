resource "aws_instance" "roboshop_instance" {
# count = 10 #Instead of using a fixed number like count = 10, we use the length() function so it dynamically calculates the number of instances based on the variable
  count         = length(var.instances)       #length function
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  # Reference the security group ID here
  vpc_security_group_ids = [aws_security_group.Security_groups.id]

  # Optional: Add tags to the instance for identification
  tags = {
    Name    = var.instances[count.index]
    Project = "Roboshop"
  }
}

resource "aws_security_group" "Security_groups" {
  name        = "allow_all_roboshop" # this is for AWS account
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
    Name = "allow_all_roboshop"
  }
}
