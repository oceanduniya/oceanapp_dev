provider "aws" {
  access_key = "XXXXXXXXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXXXXXXXXXXXX"
  region = var.region
}

resource "aws_instance" "Tiger Dev EC2" {
  ami           = lookup(var.ami_id, var.region)
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow-SSH.id]
  tags = {
     Name = "Tiger Dev Instance"
  }
}

resource "aws_security_group" "allow-SSH" {
  name        = "allow-SSH"
  description = "Allow SSH inbound traffic"
 
}