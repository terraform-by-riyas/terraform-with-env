variable "env" {
  type = string
}
variable "python_poc_ami_id" {
  type = string
  # default = "ami-0430580de6244e02e"
  description = "Default AMI when no input variable is specified explicitly"
}

variable "instance_type" {
  default = "t3.micro"
}
variable "vpc_id" {
  type = string
}
variable "security_group_id" {
  type = string
}
variable "public_subnet_id" {
  type = string
}
// Creating the EC2 private key
variable "key_name" {
  default = "test-tf-key"
}
variable "EC2_ROOT_VOLUME_SIZE" {
  type    = number
  default = "30"
}
variable "EC2_ROOT_VOLUME_TYPE" {
  type    = string
  default = "gp3"

}
variable "EC2_ROOT_VOLUME_DELETE_ON_TERMINATION" {
  type    = bool
  default = false

}
variable "disable_api_termination" {
  type    = bool
  default = true

}