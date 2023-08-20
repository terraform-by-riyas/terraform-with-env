resource "aws_instance" "poc-python" {
  ami                     = var.python_poc_ami_id
  instance_type           = var.instance_type
  key_name                = var.key_name
  vpc_security_group_ids  = [var.security_group_id]
  subnet_id               = var.public_subnet_id
  disable_api_termination = var.disable_api_termination

  root_block_device {
    volume_size           = var.EC2_ROOT_VOLUME_SIZE
    volume_type           = var.EC2_ROOT_VOLUME_TYPE
    delete_on_termination = var.EC2_ROOT_VOLUME_DELETE_ON_TERMINATION
  }

  volume_tags = {
    Name = "${var.env}-poc-python-root"
  }

  tags = {
    Name      = "${var.env}-poc-python-server"
    Terraform = "True"
  }
  lifecycle {
    ignore_changes = [ami]
  }
}
