data "aws_ami" "amzlinux" {
    most_recent = true
    owners = ["amazon"]
    filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-gp2"]

    }
    filter {
      name = "root-device-type"
      values = ["ebs"]

    }
    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
}


data "aws_security_group" "custom-sg" {
    id = "sg-0a34954162e7ec406"
  }

data "aws_subnet" "test" {
    id = "subnet-0d0c56a90fcb042ab"
  
}



