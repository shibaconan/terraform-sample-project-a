# Create Load Balancer
resource "aws_lb" "lb-config" {
  name               = var.lb_name
  internal           = var.lb_internal
  load_balancer_type = var.lb_load_balancer_type
  security_groups    = var.lb_security_groups
  subnets            = var.lb_subnets

  tags = {
    Name    = var.lb_name
    Service = var.service
    Env     = var.env
  }
}

# Create Target Group
resource "aws_lb_target_group" "lb-tg-config" {
  name     = var.lb_tg_name
  port     = var.lb_tg_port
  protocol = var.lb_tg_protocol
  vpc_id   = var.lb_tg_vpc_id

  health_check {
    protocol            = var.lb_tg_protocol
    path                = var.lb_tg_path
    port                = var.lb_tg_port
    healthy_threshold   = var.lb_tg_healthy_threshold
    unhealthy_threshold = var.lb_tg_unhealthy_threshold
    timeout             = var.lb_tg_timeout
    interval            = var.lb_tg_interval
    matcher             = var.lb_tg_matcher
  }
}

# Create Listener Config
resource "aws_lb_listener" "lb-listener-config" {
  load_balancer_arn = aws_lb.lb-config.arn
  port              = var.lb_listener_port
  protocol          = var.lb_listener_protocol
  ssl_policy        = var.lb_listener_ssl_policy
  certificate_arn   = var.lb_listener_certificate_arn
  
  default_action {
    type             = var.lb_listener_type
    target_group_arn = aws_lb_target_group.lb-tg-config.arn
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.lb-config.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# LB Attachment
resource "aws_lb_target_group_attachment" "lb-attachment" {
  for_each = toset(var.lb_tg_attach_target_ids)

  target_group_arn = aws_lb_target_group.lb-tg-config.arn
  target_id        = each.key
  port             = var.lb_tg_port
}
