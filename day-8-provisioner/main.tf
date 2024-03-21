resource "aws_vpc" "my_vpc1" {
    cidr_block = "10.0.0.0/16"
  
}

resource "aws_subnet" "sub1" {
    vpc_id                          = aws_vpc.my_vpc1.id
    cidr_block                      = "10.0.0.0/24" 
    availability_zone               = "us-east-1a"
    map_public_ip_on_launch         = true
} 

resource "aws_internet_gateway" "igw1" {
    vpc_id = aws_vpc.my_vpc1.id

}

resource "aws_key_pair" "example" {
  key_name   = "provisioner1"  # Replace with your desired key name
  public_key = file("~/.ssh/id_ed25519.pub") 


}

resource "aws_route_table" "rt1" {
    vpc_id = aws_vpc.my_vpc1.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw1.id
    }
  
}

resource "aws_route_table_association" "sub1" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.rt1.id
}

resource "aws_security_group" "websg1" {
  name   = "web1"
  vpc_id = aws_vpc.my_vpc1.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-sg"
  }
}

resource "aws_instance" "server2" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name      = aws_key_pair.example.key_name
    vpc_security_group_ids = [aws_security_group.websg1.id]
    subnet_id = aws_subnet.sub1.id




   connection {
    type        = "ssh"
    user        = "ec2-user"  # Replace with the appropriate username for your EC2 instance
    # private_key = file("C:/Users/veerababu/.ssh/id_rsa")
    private_key = file("~/.ssh/id_ed25519")  #private key path
    host        = self.public_ip
  }

  # local execution procee 
 provisioner "local-exec" {
    command = "touch file500"
   
 }
  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "file10"  # Replace with the path to your local file
    destination = "/home/ec2-user/file10"  # Replace with the path on the remote instance
  }
  # remote execution process 
  provisioner "remote-exec" {
    inline = [
"touch file200",
"echo hello from aws >> file200",
]
 }

}

 









 

