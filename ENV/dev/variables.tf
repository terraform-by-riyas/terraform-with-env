variable "env" {}
variable "ec2-instance-ami_id" {}
variable "region" {}
variable "ec2-db-server-am3-ami_id" {}
variable "python_poc_ami_id" {}
variable "ec2-db-server-am3-az" {}
variable "ec2-db-server-am3-create_spot_instance" {
    type = bool
}