variable "vpc_id" { }


locals {
    ingress_rules_jumpbox_sg = [{
		from_port  = string
		to_port  = string
		description  = string
		protocol  =  string
		cidr_block  = list(string)
	},
	{
		from_port  =  string
		to_port  =  string
		description  =  string 
		protocol  =  string 
		cidr_block  = list(string)
	}]
	egress_rules_jumpbox_sg = [{
		from_port   = string
		to_port     = string
		protocol    = string
		cidr_block  = list(string)
    }]
}