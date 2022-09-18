output "tls_private_key" {
  value     = tls_private_key.ec2-key.private_key_pem
  sensitive = true
}

output "aws_key_pair" {
  value     = aws_key_pair.key-pair.key_name
}