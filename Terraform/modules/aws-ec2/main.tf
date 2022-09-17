resource "aws_instance" "sudos-duihua-ec2" {
  ami           = var.ami-image
  instance_type = var.instance_type
  user_data = file("install.sh")
  associate_public_ip_address = true

  # the VPC subnet
  subnet_id = var.subnet_id #aws_subnet.sudos-duihua-public_subnet.id

  # the security group
  vpc_security_group_ids = [var.vpc_security_group_ids] #[aws_security_group.sudos-duihua-sg.id]

  # the public SSH key
  key_name = var.key_name #aws_key_pair.sudos-key.key_name

  tags = {
    "Name" = "sudos-duihua-ec2"
  }
}
