resource "aws_eip" "lb" {
  instance = var.aws_instance_id
  domain   = "vpc"
  provisioner "local-exec" {
    command = "echo PUBLIC IP: ${self.public_ip} > ip_ec2.txt"
  }
}

