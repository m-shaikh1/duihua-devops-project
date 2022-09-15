resource "tls_private_key" "sudos-duihua-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
output "tls_private_key" {
  value     = tls_private_key.sudos-duihua-key.private_key_pem
  sensitive = true
}

resource "aws_key_pair" "sudos-key" {
  key_name   = "sudos-key"
  public_key = tls_private_key.sudos-duihua-key.public_key_openssh
}