output "key-pem" {
  description = "Dispaly the generated private key in pem format"
  value       = module.key-pair.private_key_openssh
  sensitive   = true
  // terraform.exe output key-pem 
}
output "poc-instance-id" {
  description = "Output the EC2 id"
  value       = module.ec2-db-server-am3.id
  sensitive   = true
  // terraform.exe output key-pem 
}
