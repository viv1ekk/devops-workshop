provider "aws" {
    region = "us-east-1" 
}

resource "aws_instance" "demo_server" {
    ami = "ami-0cae6d6fe6048ca2c"
    instance_type = "t2.micro"
    key_name = "dpp" 
}