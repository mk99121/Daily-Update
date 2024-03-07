output "vpc_id" {
  value = module.vpc.vpc_id
}
output "public_subnets" {
  value = module.vpc.public_subnet_id
}
output "private_subnets" {
  value = module.vpc.privat_esubnet_id
}

output "sg-ec2" {
  value = module.sg.sg-ec2
  
}
output "instance-public-ip" {
  value = module.ec2_instance.instance_public_ip
}

output "instance_id" {
  value = module.ec2_instance.instance_id
}

output "alb_url" {
  value = module.alb.alb_URL
}