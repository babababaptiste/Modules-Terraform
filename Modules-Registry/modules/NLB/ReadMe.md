# Network Load Balancer

This file creates a Network Load Balancer a NLB Listener and a NLB Target Group

## resource aws_lb

This part creates a Network Load Balancer

- In this part we define:
    - the name of our load balancer
    - the type of the load balancer (Network)
    - 2 subnets
    - we enable the cross zone load balancing
    - the tags

```
resource "aws_lb" "load-balancer" {
  name                             = var.lb-name
  internal                         = true 
  load_balancer_type               = var.load-balancer-type
  subnets                          = [var.subnets[0], var.subnets[1]]
  enable_cross_zone_load_balancing = true

  tags = {
      project = var.project
      author  = var.author
  }
}
```
## resource aws_lb_listener

This part creates a load balancer listener

- we define:
    - the arn of the load balancer
    - the port to listen
    - the protocol to apply
    - the arn of the target group
    - the action to perform (forward)

```
resource "aws_lb_listener" "lb_listener" {  
  load_balancer_arn = aws_lb.load-balancer.arn  
  port              = var.lb-port-listener
  protocol          = var.lb-protocol-listener
  
  default_action {    
    target_group_arn = aws_lb_target_group.target-group.arn
    type             = var.lb-listener-action-type
  }
}
```
## resource aws_lb_target_group

This part creates a load balancer target group

- we define:
    - the name of the target group
    - the port of the target
    - the protocol to apply
    - the id of the vpc
    - the tags

```
resource "aws_lb_target_group" "target-group" {
  name     = var.lb-tg-group
  port     = var.lb-port-target
  protocol = var.lb-protocol-target
  vpc_id   = var.vpc-id

  tags = {
      Project = var.project
      Author  = var.author
  }
}
```

## Outputs

To be able to use the values of our new resource we need to output the value to use them in the Main.tf file.

```
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
```