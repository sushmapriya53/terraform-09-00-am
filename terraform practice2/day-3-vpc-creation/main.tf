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

#create subnets
resource "aws_subnet" "test" {
    cidr_block = "10.0.0.0/24"
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

