resource "aws_instance" "dev" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t3.micro"
    tags = {
      Name = "manual ec2"
    }
  
}

  
