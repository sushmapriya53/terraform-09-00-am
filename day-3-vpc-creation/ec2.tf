
#launch ec2

resource "aws_instance" "test" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "serverkey"
    subnet_id = aws_subnet.test.id
    associate_public_ip_address = true
    security_groups = [aws_security_group.custom_sg.id]
    tags = {
      Name = "dev-ec2"
    }
  
}
