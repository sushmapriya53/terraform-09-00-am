provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "linux" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "webserver"
    user_data = file("test.sh")
  
}