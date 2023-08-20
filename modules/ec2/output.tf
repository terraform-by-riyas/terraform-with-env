output "instance_id" {
  description = "Shows the created AWS ec2 instance id"
  value = aws_instance.poc-python.id
}