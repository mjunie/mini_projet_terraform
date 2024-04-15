variable "instancetype" {
  type        = string
  description = "set aws instance"
  default     = "t2.nano"
}

variable "aws_common_tag" {
  type        = map(any)
  description = "set aws tag"
  default = {
    Name = "ec2-tag"
  }
}

variable sg_name {
  type        = string
  description = "set sg name "
  default     = "junie-sg"
}

variable aws_instance_id {
  type        = string
  description = "set sg instance "
  default     = "junie-sg"
}



variable "security_group_name" {
  description = "Input the name of the security group."
  type        = string
}