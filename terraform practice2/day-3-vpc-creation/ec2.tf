#launch ec2
resource "aws_instance" "test" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "serverkey"
    subnet_id = aws_subnet.test.id
    tags = {
      Name = "dev-ec2"
    }
  
}
