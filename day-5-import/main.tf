provider "aws" {
  region = "us-east-1" # Replace with your AWS region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "sush.priya" # Replace with your bucket name
  # Add other configuration parameters as needed
}
