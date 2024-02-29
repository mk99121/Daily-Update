resource "aws_security_group" "main" {
  name = var.sg_name

  dynamic "ingress" {
    for_each = var.ingress_rules

    content {
      description = "Port range allowed"
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}