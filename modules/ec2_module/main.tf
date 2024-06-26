data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}


resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instancetype
  key_name      = "devops-junie"
  tags          = var.aws_common_tag
  security_groups = [var.security_group_name]

  provisioner "remote-exec" {
     inline = [
      "sudo apt update",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
     ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./../../devops-junie.pem")
      host        = self.public_ip
    }
  }
  # detroy the volume when we delete the ec2

  root_block_device {
    delete_on_termination = true
  }


}

output "ec2_id" {
  value = aws_instance.myec2.id
}

//
