provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = 4
ami = "ami-0c398cb65a93047f2"
instance_type = "c7i-flex.large"
key_name = "terraform"
vpc_security_group_ids = ["sg-0e029b6d99b1ebece"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "AppServer-1", "AppServer-2", "Monitoring server"]
}
