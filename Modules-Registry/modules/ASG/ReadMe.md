# Auto Scaling group

This file creates an Auto Scaling group, an auto scaling group attachement and output the name, Id and ARN of the ASG.

## resource aws_autoscaling_group

- The first part of the resource is where we define:
    - the name of the ASG
    - 2 subnets 
    - the desired number of instance
    - the minimum number of instance
    - the maximum number of instance
    - the arn of the target group 
```
resource "aws_autoscaling_group" "asg" {
  name                = var.asg-name
  vpc_zone_identifier = [var.subnets[0], var.subnets[1]]
  desired_capacity    = var.desired
  max_size            = var.max
  min_size            = var.min
  target_group_arns   = [var.target-group-arn]
```

- Then we associate it with the Launch Instance:
```
launch_template {
    name    = var.launch-template-name 
    version = "$Latest"
  }
  ```
- And finally we add the tags:
 ```
   tag {
      key = "Name"
      value = var.instance-name
      propagate_at_launch = true
  }
  tag {
    key = "Project"
    value = var.project
    propagate_at_launch = true
  }
  tag {
    key = "Author"
    value = var.author
    propagate_at_launch = true
  }
}
```


## resource aws_autoscaling_attachment

This file attach our auto scaling group with the Load Balancer targer group.

```
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.asg.name
  lb_target_group_arn    = var.target-group-arn 
}
```


## Outputs

To be able to use the value of our new ASG we need to output the value to use them in the Main.tf file.

```
output "AutoScalingName" {
  value = aws_autoscaling_group.asg.name
}

output "AutoScalingId" {
  value = aws_autoscaling_group.asg.id
}

output "AutoScalingARN" {
  value = aws_autoscaling_group.asg.arn
}```
