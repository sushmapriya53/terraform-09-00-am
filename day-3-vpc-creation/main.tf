#create vpc
resource "aws_vpc" "test" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "dev"
    }

      
    }
  
#create internet gateway and attach to vpc
resource "aws_internet_gateway" "test" {
    vpc_id = aws_vpc.test.id
  
}

#create public subnet
resource "aws_subnet" "test" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.test.id
  
}

#create private subnet
resource "aws_subnet" "test1" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.test.id
  
}

#create route tables
resource "aws_route_table" "test" {
    vpc_id = aws_vpc.test.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.test.id
    }
  
}

#create subnet associations
resource "aws_route_table_association" "test" {
    route_table_id = aws_route_table.test.id
    subnet_id = aws_subnet.test.id
  
}

#create elastic ip address
resource "aws_eip" "elasticip" {
    tags = {
      Name = "eip"
    }
  
}

#create nat gateway
resource "aws_nat_gateway" "natgateway" {
    subnet_id = aws_subnet.test.id
    allocation_id = aws_eip.elasticip.id
    tags = {
      Name = "natgateway"
    }
  
}

#create edit routes in nat gateway
resource "aws_route_table" "test1" {
    vpc_id = aws_vpc.test.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.natgateway.id
    }
  
}

#associate private route to private subnet
resource "aws_route_table_association" "test1" {
    route_table_id = aws_route_table.test1.id
    subnet_id = aws_subnet.test1.id
  
}

#create security group
resource "aws_security_group" "custom_sg" {
    name = "allow_tls"
    vpc_id = aws_vpc.test.id
    tags = {
      Name = "sg1"
    }
  ingress  {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }
 ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }
 }




