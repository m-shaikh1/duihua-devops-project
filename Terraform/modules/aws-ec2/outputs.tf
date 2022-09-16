output "public_ip" {
  description = "public ip "
  value       = aws_instance.sudos-duihua-ec2.public_ip
}