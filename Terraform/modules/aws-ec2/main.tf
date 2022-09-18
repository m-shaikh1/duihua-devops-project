resource "aws_instance" "sudos-duihua-ec2" {
  ami           = var.ami-image
  instance_type = var.instance_type
  user_data = file("install.sh")
  associate_public_ip_address = true
  subnet_id = var.subnet_id 
  vpc_security_group_ids = [var.vpc_security_group_ids] 
  key_name = var.key_name 
  tags = {
    "Name" = "sudos-duihua-ec2"
  }
}

