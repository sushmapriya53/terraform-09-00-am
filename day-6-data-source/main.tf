resource "aws_instance" "test" {
ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.test.id
    security_groups = [data.aws_security_group.custom-sg.id]

    tags = {
      Name = "dev-ec2"
    }
  
}