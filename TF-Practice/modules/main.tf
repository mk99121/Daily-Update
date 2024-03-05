module "vpc" {
  source = "./vpc-module"
  name   = var.name
  
  environment               = var.environment
  cidr_block                = var.cidr_block
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  availability_zones = var.availability_zones

}

module "ec2-instance" {
  source                 = "./modules/ec2/"
  name                   = var.instance-name
  ec2_count              = var.ec2_count
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [data.aws_security_group.id]
  subnet_id              = module.vpc.public_subnets[0]
  
   volume_size            = var.volume_size
}

module "security-groups" {
  source = "./sg-module"
  
}