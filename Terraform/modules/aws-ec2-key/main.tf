resource "tls_private_key" "sudos-duihua-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "sudos-key" {
  key_name   = "sudos-key"
  public_key = tls_private_key.sudos-duihua-key.public_key_openssh
}