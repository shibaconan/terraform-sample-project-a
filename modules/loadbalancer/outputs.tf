#----- LB -----$
output "lb_id" {
  value = aws_lb.lb-config.id
}

output "lb_dns_name" {
  value = aws_lb.lb-config.dns_name
}

#----- LB Target Group -----#
output "lb_tg_id" {
  value = aws_lb_target_group.lb-tg-config.id
}

#----- LB Listener -----#
output "lb_listener_id" {
  value = aws_lb_listener.lb-listener-config.id
}

#
output "lb_zone_id" {
  value = aws_lb.lb-config.zone_id
}
