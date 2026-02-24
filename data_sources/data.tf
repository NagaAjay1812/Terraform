data "aws_ami" "roboshop" { # to query the ami_id
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["NagaAjay-Ragyari-Build-2026-01-19T20-45-28Z"]
  }
}

data "aws_instance" "terraform_instance" {
  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
  filter {
    name   = "tag:Name"
    values = ["terraform"]
  }
  // At least one of filter, instance_tags, or instance_id must be specified.
}



