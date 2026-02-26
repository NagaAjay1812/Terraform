data "aws_ami" "roboshop" {
  most_recent = true
  owners      = ["self"] # or "amazon", "aws-marketplace", etc.

  filter {
    name   = "name"
    values = ["NagaAjay-Ragyari-Build-2026-01-19T20-45-28Z"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}
