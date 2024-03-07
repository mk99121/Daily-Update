/*VPC*/
name  = "Terraform"
cidr_block = "10.0.0.0/16"

public_subnet_cidr_blocks = [ "10.0.10.0/24", "10.0.20.0/24" ]

availability_zones =    [ "us-east-1a", "us-east-1b" ]

private_subnet_cidr_blocks = [ "10.0.30.0/24", "10.0.40.0/24" ]

environment = "test"


/*EC2-Instance*/
instance-name = "tf-instance"
ec2_count     = 1
ami = "ami-07761f3ae34c4478d"
instance_type = "t2.micro"
ssh_key_name = "ninja"
volume_size = "10"
volume_type = "gp2"

/*ALB*/
alb_name = "TF-alb"
load_balancer_type = "application"