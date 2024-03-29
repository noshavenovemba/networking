terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "us-east-1"
}

resource "aws_vpc" "development-vpc" {
  cidr_block = "${var.vpc_cidr}"
}

resource "aws_subnet" "test subnet 1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "us-east-1a"
}

resource "aws_security_group" "secgroup" {
  name = "${var.secgroupname}"
  #description = lookup(var.awsdemo, "secgroupname")
  #vpc_id = lookup(var.awsprops, "vpc")

  // To Allow SSH Transport
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 80 Transport
  ingress {
    from_port = 80
    protocol = ""
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "demo" {
  ami = "${var.ami_id}"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.secgroup.id
  ]
  depends_on = [ aws_security_group.secgroup]
}

output "ec2instance" {
  value = aws_instance.demo.public_ip
}
