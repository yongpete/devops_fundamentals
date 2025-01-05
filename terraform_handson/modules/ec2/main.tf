data "aws_ami" "latest_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# defining the EC2 Instance
resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.latest_ami.id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  subnet_id = var.pub_subnet_1_id

  tags = {
    Name = var.instance_name
  }
  provisioner "local-exec" {
    command = "echo Your instance public IP address is: ${aws_instance.ec2_instance.public_ip} > ./outputs/publicIP.txt"
    on_failure = continue
  }
}