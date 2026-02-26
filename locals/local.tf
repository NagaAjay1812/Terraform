locals {
  instance_name = "${var.name}-${var.env}" # locals-dev
  instance_type = "t3.micro"
  common_tags = {
    project     = "roboshop",
    Terraform   = true,
    Environment = "dev"
  }
  ec2_final_tags = merge(local.common_tags, var.ec2_tags)
}
