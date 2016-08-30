#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-2d4f8564
#
# Your security group ID is:
#
#     sg-6da31b17
#
# Your AMI ID is:
#
#     ami-db24d8b6
#
# Your Identity is:
#
#     ttt-c81e728d9d4c2f636f067f89cc14862c
#

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "us-east-1"
}


provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
  ami = "ami-db24d8b6"
  instance_type = "t2.micro"
  subnet_id = "subnet-2d4f8564"
  vpc_security_group_ids = ["sg-6da31b17"]
  tags {
    Identity = "ttt-c81e728d9d4c2f636f067f89cc14862c"
    Name = "Test michel"
    test = "true"
  }
  count = 2
}

output "public_ip" {
  value = ["${aws_instance.web.*.public_ip}"]
}
output "public_dns" {
  value = ["${aws_instance.web.*.public_dns}"]
}

