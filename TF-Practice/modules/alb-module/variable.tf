variable "alb_name" {
  type = string
}
variable "load_balancer_type" {
  type = string
}
variable "cross_zone_lb" {
  type = bool
  default = true
}
variable "vpc_id" {}
variable "subnet_ids" {}
variable "security_group_ids" {}
variable "instance_id" {}
variable "internal_alb" {
  type = bool
  default = false
}
variable "idle_timeout" {
  description = "The time that the connection is allowed to be idle."
  type        = number
  default     = 60
}
variable "alb_listener_port" {
  description = "The external-facing port for the ELB."
  type        = number
  default     = 80
}
variable "alb_listener_protocol" {
  type = string
  default = "HTTP"
}
variable "target_group_name" {
  type = string
  default = "TF-tg"
}
variable "target_group_sticky" {
  type = bool
  default = true
}
variable "service_port" {
  type = string
  default = "80"
}
variable "target_group_port" {
    type = string
    default = "80"
}

variable "target_group_path" {
    type = string
    default = "/"
}