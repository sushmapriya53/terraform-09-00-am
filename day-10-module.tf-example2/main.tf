module "ec2_instance" {
    source = "../day-2-ec2"
    instance_type = "t2.micro"
    key_name      = "serverkey"
  
    }  
