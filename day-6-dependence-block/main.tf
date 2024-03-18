resource "aws_instance" "linux" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "webserver"

  
}

resource "aws_s3_bucket" "test" {
    bucket = "eruiodft"
    depends_on = [ aws_instance.linux ]

  
}