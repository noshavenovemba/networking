terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 3.0"
   }
 }
}

provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "us-east-1"
}

resource "aws_instance" "ec2_instance" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    subnet_id = "${var.subnet_id}"
    instance_type = "${var.instance_type}"
    key_name = "${var.ami_key_pair_name}"
} 

resource "aws_instance" "demo" {
 ami = “ami-00831fc7c1e3ddc60”
 instance_type = “t2.micro”

 tags = {
   name = "Demo System"
 }
}

output "instance_id" {
 instance = aws_instance.demo.id
}
