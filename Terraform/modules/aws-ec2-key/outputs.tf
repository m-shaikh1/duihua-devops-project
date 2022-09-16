output "tls_private_key" {
  value     = tls_private_key.sudos-duihua-key.private_key_pem
  sensitive = true
}

output "aws_key_pair" {
  value     = aws_key_pair.sudos-key.key_name
}