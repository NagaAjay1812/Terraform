resource "aws_instance" "roboshop" {
  ami           = data.aws_ami.roboshop.id
  instance_type = local.instance_type
  # Reference the security group ID here
  vpc_security_group_ids = [aws_security_group.roboshop_sg.id]

  # Optional: Add tags to the instance for identification
  tags = local.ec2_final_tags

}


resource "aws_security_group" "roboshop_sg" {
  name        = "terraform_testing_sg_new" # this is for AWS account
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
