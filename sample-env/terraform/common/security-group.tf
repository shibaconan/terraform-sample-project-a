# Create Security Group
resource "aws_security_group" "sg-work-config" {
  name        = "sample-work-sg"
  description = "Security group for sample-work"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "sample-work"
  }
}

resource "aws_security_group_rule" "sg-work-group-rule" {
  type                     = "ingress"
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sg-work-config.id
  from_port                = 22
  security_group_id        = aws_security_group.sg-work-config.id
}

resource "aws_security_group" "sg-ope-config" {
  name        = "sample-sg"
  description = "Security group for sample-sg"
  vpc_id      = module.vpc.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["111.111.111.111/32"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["112.112.112.112/32"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["113.113.113.113/32"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["114.114.114.114/32"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["115.115.115.115/32"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["116.116.116.116/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sample-sg"
  }
}
