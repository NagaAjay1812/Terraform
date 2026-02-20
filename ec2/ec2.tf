resource "aws_instance" "roboshop_instance" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"

  # Optional: Add tags to the instance for identification
  tags = {
    Name    = "terraform"
    Project = "Roboshop"
  }
}