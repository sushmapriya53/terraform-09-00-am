module "test" {

  source = "../day-2-ec2"
  ami_id = "ami-02d7fd1c2af6eead0"
  instance_type = "t2.micro"
  key_name = "serverkey"
}