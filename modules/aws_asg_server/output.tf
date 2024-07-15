output "webserver_external_dns_name" {
  value = aws_lb.load_balancer.dns_name
}

output "webserver_lb_external_arn" {
  value = aws_lb.load_balancer.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.target_group.arn
}

