# define the aws provider configuration
provider "aws" {
    region = "us-east-1" # replce with your desired aws region
  
}

resource "aws_key_pair" "linuxkey" {
    key_name = "day-8a"  # replace with your desired aws key name
    public_key = file("~/.ssh/id_ed25519.pub") 
  
}

resource "aws_instance" "server2" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = aws_key_pair.linuxkey.key_name
  
}