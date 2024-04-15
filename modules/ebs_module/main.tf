
resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = "us-east-1a"
  size              = var.ebs_size

  # tags = {
  #   Name = "HelloWorld"
  # }
}

