output "tls_private_key" {
  value     = module.key.tls_private_key
  sensitive = true
}
output "public_ip" {
  description = "public ip address of the ec2"
  value       = module.ec2.public_ip
}