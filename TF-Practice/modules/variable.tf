/**VPC**/

variable "cidr_block" {
    type = string
   
}

variable "public_subnet_cidr_blocks" {
    type =  list(string)
   
}

variable "availability_zones" {
    type = list(string)
 
}

variable "private_subnet_cidr_blocks" {
    type = list(string)

}

 variable "name" {
    type = string
   
 }
 
 variable "environment" {
    type = string
    
 }
 

 /**EC2-INSTANCE**/

 variable "ami" {
  description = "ami id"
  default     = ""
}

variable "ec2_count" {
  description = "ec2 intance count"
  default     = ""
}

variable "instance_type" {
  description = "instance type"
  default     = ""
}

variable "key_name" {
  description = "pem key name"
  default     = ""
}

variable "security_group_ids" {
  description = "A list of security group IDs to assign to the ec2"
  type        = list(string)
  default     = [""]
}

variable "aws_subnet_id" {
  description = "aws subnet id"
  default     = ""
}

variable "instance-name" {
  description = "name of the ec2"
  default     = ""
}

variable "ssh_private_key_file" {
  description = "ssh private key file"
  default     = ""
}

variable "vpc_security_group_ids" {
  description = "vpc security group ids"
  default     = ""
}

variable "subnet_id" {
  description = "subnet id"
  default     = ""
}

variable "volume_type" {
  description = "volume type"
  default     = "gp2"
}

variable "volume_size" {
  description = "volume type"
  default     = ""
}

variable "delete_on_termination" {
  description = "delete on termination"
  default     = true
}

/**SECURITY-GROUPS**/

locals {
    ingress_rules_jumpbox_sg = [{
		from_port  = string
		to_port  = string
		description  = "ssh_JumpBox" 
		protocol  = "TCP" 
		cidr_block  = ["0.0.0.0/0"]
	},
	{
		from_port  =  3389 
		to_port  =  3389 
		description  =  "Windows jump box" 
		protocol  =  "TCP" 
		cidr_block  = ["0.0.0.0/0"]
	}]
	egress_rules_jumpbox_sg = [{
		from_port   = 0
		to_port     = 65535
		protocol    = "All"
		cidr_block  = ["0.0.0.0/0"]
    }]
}