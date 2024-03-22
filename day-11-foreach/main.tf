resource "aws_instance" "test" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    for_each = toset(var.sandboxes)
    tags = {
      Name = each.value
    }
  
}