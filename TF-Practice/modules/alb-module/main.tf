resource "aws_alb" "alb" {  
  name            = var.alb_name
  subnets         = var.subnet_ids
  security_groups = var.security_group_ids
  internal        = var.internal_alb 
  idle_timeout    = var.idle_timeout  
    
 /* access_logs {    
    bucket = "${var.s3_bucket}"    
    prefix = "ELB-logs"  
  }*/
}
resource "aws_alb_listener" "alb_listener" {  
  load_balancer_arn = aws_alb.alb.arn  
  port              = var.alb_listener_port
  protocol          = var.alb_listener_protocol
  
  default_action {    
    target_group_arn = aws_alb_target_group.alb_target_group.arn
    type             = "forward"  
  }
}

resource "aws_alb_listener_rule" "listener_rule" {
  depends_on   = [aws_alb_target_group.alb_target_group]  
  listener_arn = aws_alb_listener.alb_listener.arn
  #priority     = "${var.priority}"   
  action {    
    type             = "forward"    
    target_group_arn = aws_alb_target_group.alb_target_group.id
  }   
  condition {    
    path_pattern {
     values = ["/"]
   } 
  }
}

resource "aws_alb_target_group" "alb_target_group" {  
  name     = var.target_group_name 
  port     = var.service_port
  protocol = "HTTP"  
  vpc_id   = var.vpc_id
     
 /* stickiness {    
    type            = "lb_cookie"    
    cookie_duration = 1800    
    enabled         = "${var.target_group_sticky}"  
  }*/   
  health_check {    
    healthy_threshold   = 3    
    unhealthy_threshold = 10    
    timeout             = 5    
    interval            = 10    
    path                = var.target_group_path
    port                = var.target_group_port 

  }
}

resource "aws_lb_target_group_attachment" "tg_attachment_a" {
 target_group_arn = aws_alb_target_group.alb_target_group.arn
 target_id        = var.instance_id[0]
 port             = 80
}