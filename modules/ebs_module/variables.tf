

variable "aws_common_tag" {
  type        = map(any)
  description = "set aws tag"
  default = {
    Name = "ec2-tag"
  }
}


variable ebs_size {
  type        = number
  description = "set ebs volume"
  default     = 50
}

