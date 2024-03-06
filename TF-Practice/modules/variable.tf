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
  type = string
}

variable "ec2_count" {
  description = "ec2 intance count"
  type = string
  
}

variable "ssh_key_name" {
  description = "pem key name"
  
}

/*variable "security_group_ids" {
  description = "A list of security group IDs to assign to the ec2"
  type        = list(string)
  
}

variable "subnet_id" {
  description = "aws subnet id"
  
}*/

variable "instance-name" {
  description = "name of the ec2"

}


variable "volume_type" {
  description = "volume type"
  type = string
}

variable "volume_size" {
  description = "volume type"
  type = string
}

variable "instance_type" {
  type = string
}
/**SECURITY-GROUPS**/

