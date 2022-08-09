###################################################
# Author: bfayty Date: 18/05/2022
# Version : 1.0
#
# Description:
# 1 launch template
###################################################

###Define a template to launch in the ASG###
resource "aws_launch_template" "asg-lt" {
  name                   = var.lt-name
  key_name               = var.key-name
  image_id               = var.image-id
  instance_type          = var.instance-type
  vpc_security_group_ids = [var.security-group]

  block_device_mappings {
    device_name = var.device-name
    ebs {
      delete_on_termination = "true" 
      encrypted             = "true" 
      kms_key_id            = var.kms-key-arn
      volume_type           = var.volume-type
    }
  }

  tags = {
    "Name"    = var.instance-name
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      "Name"    = var.instance-name
      }
  }
}

//Output the value to use them in the root file
output "launchTemplateName" {
  value = aws_launch_template.asg-lt.name
}

output "launchTemplateId" {
  value = aws_launch_template.asg-lt.id
}

output "launchTemplateARN" {
  value = aws_launch_template.asg-lt.arn
}

output "Instance-name" {
  value = var.instance-name
}