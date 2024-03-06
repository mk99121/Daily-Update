variable "vpc_id" { }


locals {
    ingress_rules_ec2_sg = [{
		from_port  = 22
		to_port  = 22
		description  = "ssh_JumpBox" 
		protocol  = "TCP" 
		cidr_block  = ["0.0.0.0/0"]
	},
	{
		from_port  =  80 
		to_port  =  80
		description  =  "Windows jump box" 
		protocol  =  "TCP" 
		cidr_block  = ["0.0.0.0/0"]
	},
	{
		from_port  =  3389 
		to_port  =  3389 
		description  =  "Windows jump box" 
		protocol  =  "TCP" 
		cidr_block  = ["0.0.0.0/0"]
	}]
	egress_rules_ec2_sg = [{
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_block  = ["0.0.0.0/0"]
    }]
}