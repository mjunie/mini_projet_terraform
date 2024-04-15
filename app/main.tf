provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
}

# store data(app-junie.tfstate file) in s3
terraform {
  backend "s3" {
    bucket     = "terraform-backend-junie"
    key        = "app-junie.tfstate"
    region     = "us-east-1"
    access_key = "PUT YOUR OWN"
    secret_key = "PUT YOUR OWN"
  }
}

module "security_group" {
  source  = "../modules/sg_module"
  sg_name = "app-junie-sg"
}


module "ec2_instance" {
  source       = "../modules/ec2_module"
  instancetype = "t2.micro"
  aws_common_tag = {
    Name = "ec2-app-junie"
  }
  security_group_name = "app-junie-sg"

}

module "ipmodule" {
  source          = "../modules/public_ip_module"
  aws_instance_id = module.ec2_instance.ec2_id
}

module "ebsmodule" {
  source   = "../modules/ebs_module"
  ebs_size = 20
}

//

