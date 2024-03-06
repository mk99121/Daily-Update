variable "ami" {
  description = "ami id"
  type = string
}

variable "ec2_count" {
  description = "ec2 intance count"
   type =     string
}

variable "instance_type" {
  description = "instance type"
  type = string
  
}

variable "ssh_key_name" {
  description = "pem key name"
   type = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to assign to the ec2"
 
}

 variable "instance-name" {
   type = string
}
variable "subnet_id" {
  description = "subnet id"
 
}

variable "volume_type" {
  description = "volume type"
  default     = "gp2"
}

variable "volume_size" {
  description = "volume size"
  type = string
}


