variable "vpcs" {
  type = map(
    object(
    {
    vpc-name              = string
    vpc-cidr              = string
    vpc-azs               = list(string)
    vpc-pvt-sub           = list(string)
    vpc-pub-sub           = list(string)
    enable_nat            = bool
    single_nat            = bool
    dns_hostnames         = bool 
    dns_support           = bool
    public_ip             = bool

  }
 )
)
}

variable "public_subnet_tags" {
  type = map(string)
  default = {
    Name = "public-subnets"
  }
}

variable "private_subnet_tags" {
  type = map(string)
  default = {
    Name = "private-subnets"
  }
}
/* ALB */

variable "alb" {
  type = map(
    object(
      {
        name = string
        internal = bool
        load_balancer_type = string

      }
    )
  )
  
}

/*variable "my-tg-name" {
  type = string
}

variable "tg-type" {
  type = string
}
/*EC2*/
variable "instances" {
     type = map(
    object(
      {
        instance_type     = string
        
      }
    )
     )
    
}


/*SECURITY-Group*/
variable "sg_name" {
  type = string
  
}
variable "ingress_rules" {
  type = map(
    object(
      {
        from_port   = string
        to_port     = string
       
      }
    )
  )
       
   }
