module "alb" {
  source  = "../../../modules/loadbalancer"
  service = "sample"
  env     = "test"

  #----- LB -----$
  lb_name               = "sample-alb"
  lb_internal           = "false"
  lb_load_balancer_type = "application"
  lb_security_groups    = [aws_security_group.sg-alb-config.id]
  lb_subnets            = [
    data.terraform_remote_state.common.outputs.vpc_sub_pub_a_id,
    data.terraform_remote_state.common.outputs.vpc_sub_pub_c_id
  ]

  #----- LB Target Group -----#
  lb_tg_name                = "sample-target-group"
  lb_tg_vpc_id              = data.terraform_remote_state.common.outputs.vpc_id

  lb_tg_protocol            = "HTTP"
  lb_tg_path                = "/healthcheck"
  lb_tg_port                = 80
  lb_tg_healthy_threshold   = "5"
  lb_tg_unhealthy_threshold = "2"
  lb_tg_timeout             = "5"
  lb_tg_interval            = "30"
  lb_tg_matcher             = "200"

  #----- LB Listener -----#
  lb_listener_port            = "443"
  lb_listener_protocol        = "HTTPS"
  lb_listener_ssl_policy      = "ELBSecurityPolicy-2016-08"

  lb_listener_certificate_arn = data.terraform_remote_state.common.outputs.acm_certificate_arn
  lb_listener_type            = "forward"

  #----- LB Target Group Attachment -----#
  lb_tg_attach_target_ids = [
    module.ec2-prod-web.ec2_id,
    module.ec2-prod-web02.ec2_id
  ]
}
