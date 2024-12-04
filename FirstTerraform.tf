terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.75.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "main1" {
  cidr_block       = "20.20.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "myvpc1"
  }
}
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main1.id
  cidr_block = "20.20.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public1"
  }
}