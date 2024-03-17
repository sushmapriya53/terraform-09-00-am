resource "aws_instance" "linux"{
  ami = "ami-02d7fd1c2af6eead0"
  instance_type = "t2.micro"
  tags = {
    Name = "manual ec2"
  }
}

  provider "aws" {
  region = "us-east-1" # Replace with your AWS region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "sush.priya" # Replace with your bucket name
  # Add other configuration parameters as needed
}
