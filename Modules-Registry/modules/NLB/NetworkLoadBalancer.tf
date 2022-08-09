###################################################
# Author: bfayty Date: 10/05/2022
# Version : 1.1
#
# Description:
# 1 Network Load Balancer, 1 NLB Listener, 1 NLB Target Group
# 1 AutoScalling Attachement and 1 Launch Template
###################################################
###Load Balancer###
resource "aws_lb" "load-balancer" {
  name                             = var.lb-name
  internal                         = true 
  load_balancer_type               = var.load-balancer-type
  subnets                          = [var.subnets[0], var.subnets[1]]
  enable_cross_zone_load_balancing = true

  tags = {
      Name = var.lb-name
  }
}

###Load Balancer Listener###
resource "aws_lb_listener" "lb_listener" {  
  load_balancer_arn = aws_lb.load-balancer.arn  
  port              = var.lb-port-listener
  protocol          = var.lb-protocol-listener
  
  default_action {    
    target_group_arn = aws_lb_target_group.target-group.arn
    type             = var.lb-listener-action-type
  }
}

###Load Balancer Target Group###
resource "aws_lb_target_group" "target-group" {
  name     = var.lb-tg-group
  port     = var.lb-port-target
  protocol = var.lb-protocol-target
  vpc_id   = var.vpc-id

  tags = {
      Name = var.lb-tg-group
  }
}

//Output the value to use them in the root file
output "LoadBalancerId" {
  value = aws_lb.load-balancer.id
}
output "LoadBalancerARN" {
  value = aws_lb.load-balancer.arn
}
output "LoadBalancerDNS" {
  value = aws_lb.load-balancer.dns_name
}
output "LoadBalancerName" {
  value = aws_lb.load-balancer.name  
}

output "TargetGroupArn" {
  value = aws_lb_target_group.target-group.arn
}
output "TargetGroupId" {
  value = aws_lb_target_group.target-group.id
}
output "TargetGroupName" {
  value = aws_lb_target_group.target-group.name
}

output "ListenerArn" {
  value = aws_lb_listener.lb_listener.arn
}
output "ListenerId" {
  value = aws_lb_listener.lb_listener.id
}