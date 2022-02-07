#--------------------------------------------------------------------------------
# Common Variables
#--------------------------------------------------------------------------------
variable "service" {}
variable "env" {}

#--------------------------------------------------------------------------------
# LB Variables
#--------------------------------------------------------------------------------
#----- LB -----$
variable "lb_name" {}
variable "lb_internal" {}
variable "lb_load_balancer_type" {}
variable "lb_security_groups" {type = list(string)}
variable "lb_subnets" {type = list(string)}

#----- LB Target Group -----#
variable "lb_tg_name" {}
variable "lb_tg_vpc_id" {}

variable "lb_tg_protocol" {}
variable "lb_tg_path" {}
variable "lb_tg_port" {}
variable "lb_tg_healthy_threshold" {}
variable "lb_tg_unhealthy_threshold" {}
variable "lb_tg_timeout" {}
variable "lb_tg_interval" {}
variable "lb_tg_matcher" {}

#----- LB Listener -----#
variable "lb_listener_port" {}
variable "lb_listener_protocol" {}
variable "lb_listener_ssl_policy" {}
variable "lb_listener_certificate_arn" {}
variable "lb_listener_type" {}

#----- LB Target Group Attachment -----#
variable "lb_tg_attach_target_ids" {}
