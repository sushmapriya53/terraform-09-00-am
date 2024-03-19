provider "aws" {
    region = "us-east-1"
  
}

data "aws_vpc" "test" {
  filter {
    name = "tag:Name"
    values = ["dev"] #giv your vpc name 
  }
}

data "aws_subnet" "test" {
  filter {
    name = "tag:Name"
    values = ["test"] # give your subnet name 
  }
}

resource "aws_security_group" "custom-sg" {
  name        = "allow_tls"
  vpc_id      = data.aws_vpc.test.id
  tags = {
    Name = "sg1"
  }
 
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }



egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


  }
  

resource "aws_instance" "test" {
  ami ="ami-02d7fd1c2af6eead0"
  instance_type = "t2.micro"
  key_name= "serverkey"
  vpc_security_group_ids = [aws_security_group.custom-sg.id]
  subnet_id =  data.aws_subnet.test.id
  tags = {
    Name = "DataSource- Instance"
  }
}