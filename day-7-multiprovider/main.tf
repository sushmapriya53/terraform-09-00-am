provider "aws" {
    region = "ap-south-1"

  }
  #another provider alias
  provider "aws" {
    region = "us-east-1"
    alias = "america"
    
  }
  resource "aws_s3_bucket" "dev1" {
    bucket = "hp-hyd-harsha-it"
    
  }
  resource "aws_s3_bucket" "dev2" {
    bucket = "hp-hyd-harsha-it-dev2"
    provider = aws.america
    
  }