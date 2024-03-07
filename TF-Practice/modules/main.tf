module "vpc" {
  source = "./vpc-module"
  name   = var.name
  
  environment               = var.environment
  cidr_block                = var.cidr_block
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  availability_zones = var.availability_zones

}

module "ec2_instance" {
  source        = "./ec2-module"
  instance-name = var.instance-name
  ami           = var.ami
  ec2_count     = var.ec2_count
  instance_type = var.instance_type
  ssh_key_name  = var.ssh_key_name
  security_group_ids = [module.sg.sg-ec2]
  subnet_id      = module.vpc.public_subnet_id[0]
  volume_type    = var.volume_type
  volume_size    = var.volume_size
}

module "sg" {
  source = "./sg-module"

 
  vpc_id      = module.vpc.vpc_id

}

module "alb" {
  source = "./alb-module"
  
  alb_name = var.alb_name
  load_balancer_type = var.load_balancer_type
  
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_id[*]
  security_group_ids = [module.sg.sg-ec2]
  instance_id = module.ec2_instance.instance_id[*]


}