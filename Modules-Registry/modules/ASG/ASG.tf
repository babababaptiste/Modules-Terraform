###################################################
# Author: bfayty Date: 10/05/2022
# Version : 1.1
#
# Description:
# Resource to launch AWS Auto scaling group with 1 auto scaling attachment
###################################################

###Autoscalling Group###
resource "aws_autoscaling_group" "asg" {
  name                = var.asg-name
  vpc_zone_identifier = [var.subnets[0], var.subnets[1]]
  desired_capacity    = var.desired
  max_size            = var.max
  min_size            = var.min
  target_group_arns   = [var.target-group-arn] 

  launch_template {
    name    = var.launch-template-name 
    version = "$Latest"
  }

  tag {
      key = "Name"
      value = var.instance-name
      propagate_at_launch = true
  }
}

###AutoScaling Attachment###
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.asg.name
  lb_target_group_arn    = var.target-group-arn 
}

//Output the value to use them in the root file
output "AutoScalingName" {
  value = aws_autoscaling_group.asg.name
}

output "AutoScalingId" {
  value = aws_autoscaling_group.asg.id
}

output "AutoScalingARN" {
  value = aws_autoscaling_group.asg.arn
}