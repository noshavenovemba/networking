terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

variable "awsdemo" {
    default = {
    ami = "ami-0574da719dca65348"
    region = "us-east-1"
    secgroupname = "Demo-Sec-Group"

  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "!!!"
  secret_key = "!!!"
  #profile = "default"
}

resource "aws_security_group" "awsdemosg" {
  name = lookup(var.awsdemo, "secgroupname")
  description = lookup(var.awsdemo, "secgroupname")
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
  ami = lookup(var.awsdemo, "ami")
  instance_type = "t2.micro"
}
