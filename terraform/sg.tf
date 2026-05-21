resource "aws_security_group" "this" {
  name_prefix = "${var.app_name}-${var.environment}-sg-"
  description = "Security Group for ${var.app_name}-${var.environment} instances"
  vpc_id      = data.aws_vpc.main.id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.app_name}-${var.environment}-sg"
  }
}

resource "aws_vpc_security_group_egress_rule" "this" {
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
  description       = "Allow egress"
  security_group_id = aws_security_group.this.id
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  description       = "Allow ingress"
  security_group_id = aws_security_group.this.id
  from_port         = 22
  to_port           = 22
}
