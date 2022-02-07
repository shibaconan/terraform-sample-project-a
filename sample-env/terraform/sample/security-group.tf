# Create Security Group
resource "aws_security_group" "sg-alb-config" {
  name        = "sample-alb-sg"
  description = "Security group for sample-alb"
  vpc_id      = data.terraform_remote_state.common.outputs.vpc_id
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sample-alb-sg"
  }
}

resource "aws_security_group" "sg-web-config" {
  name        = "sample-web-sg"
  description = "Security group for sample-web"
  vpc_id      = data.terraform_remote_state.common.outputs.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.sg-alb-config.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sample-web-sg"
  }
}

resource "aws_security_group" "sg-rds-config" {
  name        = "sample-rds-sg"
  description = "Security group for sample-rds"
  vpc_id      = data.terraform_remote_state.common.outputs.vpc_id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [
      aws_security_group.sg-web-config.id
    ]
    description = "Access from Web Server"
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [
      data.terraform_remote_state.common.outputs.sg_ope_id
    ]
    description = "Access from Operation Server"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sample-rds"
  }
}
