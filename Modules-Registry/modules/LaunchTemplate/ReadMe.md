# Launch Template

This file creates a Launch Instance.

## resource LaunchTemplate

- On the first part of the resource we define:

    - the name of the launch template

    - the name of the key pair to associate to the instance

    - the id of the ami

    - the type of instance to launch

    - the id of the security group


```
resource "aws_launch_template" "asg-lt" {
  name                   = var.lt-name
  key_name               = var.key-name
  image_id               = var.image-id
  instance_type          = var.instance-type
  vpc_security_group_ids = [var.security-group]
```

- Then we add storage to the instance by defining:

    - the name of the device
    - the id of the kms key
    - the type of volume

```
block_device_mappings {
    device_name = var.device-name
    ebs {
      delete_on_termination = "true" 
      encrypted             = "true" 
      kms_key_id            = var.kms-key-arn
      volume_type           = var.volume-type
    }
  }
```

- Then we add tags to the Launch Template:

```
tags = {
    project = var.project
    author  = var.author
  }
```

- Finaly we add tags for the instance:

```
tag_specifications {
    resource_type = "instance"
    tags = {
      "Author"  = var.author
      "Name"    = var.instance-name
      "Project" = var.project
      }
  }
}
```
## Outputs

To be able to use the values of the resource we need to output the value to use them in the Main.tf file.

```
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
```