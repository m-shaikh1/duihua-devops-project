output "public_ip" {
  description = "public ip "
  value       = aws_instance.ubuntu-ec2.public_ip
}