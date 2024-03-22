resource "aws_instance" "test" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    count         = 2
  tags            = {
    Name          = "dev.${count.index}"
  } 
}





  
