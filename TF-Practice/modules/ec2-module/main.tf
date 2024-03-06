resource "aws_instance" "test" {
  associate_public_ip_address = "true"
  ami                         = var.ami
  count                       = var.ec2_count
  instance_type               = var.instance_type
  key_name                    = var.ssh_key_name
  vpc_security_group_ids      = var.security_group_ids
  subnet_id                   = var.subnet_id
  #ebs_optimized               = true   

  tags = {
    Name            = var.instance-name
    Env             = "test"

  }

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = true
  }
}