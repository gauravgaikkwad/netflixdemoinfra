provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = 4
ami = "ami-052064a798f08f0d3"
instance_type = "t3.small"
key_name = "jenkins"
vpc_security_group_ids = ["sg-0f5196ef065be7d3c"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "AppServer-1", "AppServer-2", "Monitoring server"]
}
