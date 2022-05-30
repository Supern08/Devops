terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  #access_key = ""
  #secret_key = ""
}

resource "aws_security_group" "sg" {
  name        = "webserver09"
  vpc_id      = "vpc-0df7575433bc56cf8"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [ "10.0.0.0/24" ]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "webserver"
    User = "Supern"
  }
}




