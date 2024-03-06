
resource "aws_security_group" "ec2_sg" {
	name   = "jumpbox_sg"
	vpc_id =  var.vpc_id
  

  dynamic "ingress" {
		for_each = local.ingress_rules_ec2_sg

		content {
			description = ingress.value.description
			from_port   = ingress.value.from_port
			to_port     = ingress.value.to_port
			protocol    = ingress.value.protocol
			cidr_blocks = ingress.value.cidr_block
		}
	}
		
	dynamic "egress" {
		for_each = local.egress_rules_ec2_sg

		content {
			from_port   = egress.value.from_port
			to_port     = egress.value.to_port
			protocol    = egress.value.protocol
			cidr_blocks = egress.value.cidr_block
		}
	}
	tags = {
		Name = "jumpbox_sg"
		Env  = "test"
	}
}