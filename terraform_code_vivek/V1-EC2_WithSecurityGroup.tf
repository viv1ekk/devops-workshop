provider "aws" {
    region = "us-east-1" 
}

resource "aws_instance" "demo_server" {
    ami = "ami-0cae6d6fe6048ca2c"
    instance_type = "t2.micro"
    key_name = "dpp" 
    security_groups = [ "demo_sg" ] 
}



resource "aws_security_group" "demo_sg" {
  name        = "web-server-sg"
  description = "SSH Access"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Be cautious with 0.0.0.0/0 in production
  }

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh-prot"
  }
}
