module "vpc" {
  source = "../../modules/vpc"
  vpc_id = module.vpc.vpc_id
  env    = var.env
}
module "key-pair" {
  source             = "terraform-aws-modules/key-pair/aws"
  version            = "2.0.2"
  key_name           = "test-tf-key"
  create_private_key = true

}
module "security_group" {
  source = "../../modules./sg"
  vpc_id = module.vpc.vpc_id
}

# module "ec2" {
#   source            = "../../modules./ec2"
#   key_name          = module.key-pair.key_pair_name
#   vpc_id            = module.vpc.vpc_id
#   security_group_id = module.security_group.security_group_id
#   public_subnet_id  = module.vpc.public_subnet_id
#   python_poc_ami_id = "${var.python_poc_ami_id}"
#   env = "${var.env}" // must decalre this argument here because, the value is given from the tfvar. There is no value on the variable file.
# }

# module "ec2-instance" {
#   source   = "terraform-aws-modules/ec2-instance/aws"
#   version  = "5.3.1"
#   name     = "my-ec2-test"
#   key_name = module.key-pair.key_pair_name
#   ami                    = "${var.ec2-instance-ami_id}" 
#   vpc_security_group_ids = [module.security_group.security_group_id]
#   subnet_id              = module.vpc.public_subnet_id
#   tags = {
#     Name      = "${var.env}-ec2-ec2-instance"
#     Terraform = "Yes"
#     env = "${var.env}"
#   }
# }
module "ec2-db-server-am3" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "5.3.1"
  name                   = "az3"
  key_name               = module.key-pair.key_pair_name
  ami                    = var.ec2-db-server-am3-ami_id
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_id              = module.vpc.public_subnet_id
  instance_type = "t3.nano"

   tags = {
    Name      = "${var.env}-ec2-db-server-am3"
    Terraform = "Yes"
    env       = "${var.env}"
  }

}