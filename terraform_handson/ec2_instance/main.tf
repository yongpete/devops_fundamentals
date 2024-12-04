# defining the EC2 Instance

resource "aws_instance" "test_ec2" {
  ami             = "ami-0b5673b5f6e8f7fa7" # amazon linux
  instance_type   = "t2.micro"
  key_name        = "demo_key"
  security_groups = [aws_security_group.allow_ssh.name]
  tags = {
    Name : "Via_Terraform"
  }

}