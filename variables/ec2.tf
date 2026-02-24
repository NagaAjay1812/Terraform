resource "aws_instance" "roboshop_instance" {
  ami           = var.ami_id
  instance_type = var.ins_type
  # Reference the security group ID here
  vpc_security_group_ids = [aws_security_group.Security_groups.id] # its already variable so that why we r not keeping in varaibles

  # Optional: Add tags to the instance for identification
  tags = var.ec2_tags
}

resource "aws_security_group" "Security_groups" {
  name        = var.sg_name # this is for AWS account
  description = var.sg_des

  ingress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_locks
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_locks
    ipv6_cidr_blocks = ["::/0"]

  }

  tags = var.sg_tags
}
