resource "aws_instance" "ubuntu-ec2" {
  ami           = var.ami-image
  instance_type = var.instance_type
  user_data = file("install.sh")
  associate_public_ip_address = true
  subnet_id = var.subnet_id 
  vpc_security_group_ids = [var.vpc_security_group_ids] 
  key_name = var.key_name 
  tags = {
    "Name" = "ubuntu-ec2"
  }
}

