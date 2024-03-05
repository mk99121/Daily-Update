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


variable "ssh_private_key_file" {
  description = "ssh private key file"
  default     = ""
}
 variable "instance-name" {
   
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
  description = "volume size"
  default     = ""
}

variable "delete_on_termination" {
  description = "delete on termination"
  type = bool
}
