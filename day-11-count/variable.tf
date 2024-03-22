variable "ami" {
  type    = string
  default = "ami-02d7fd1c2af6eead0"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "sandboxes" {
    type = list(string)
    default = ["dev","test","prod"]
    
     
}