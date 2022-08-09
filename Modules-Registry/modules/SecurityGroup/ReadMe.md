# Security Group

This code enable you to create a security group

## resource aws_security_group

The first part of the resource is where we define:
    - The name of the security group
    - A description
    - Id of the VPC


```
resource "aws_security_group" "security-group" {
    
  name        = var.SG-name
  description = var.SG-description
  vpc_id      = var.vpc-id
```

Then we specify the ingress with:
    - The start port
    - The end range port
    - The protocol
    - The cidr blocks

```
dynamic "ingress" { 
    for_each = var.ingress-parameters //Use for_each in dynamic to create 1 egress specification for each parameters
    content {
      from_port   = ingress.value.from-port
      to_port     = ingress.value.to-port
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.cidr-blocks]
    }
  }
```

We do the same thing for the egress part:

The "for each" loop helps to create as many specification as you want.

```
dynamic "egress" { 
    for_each = var.egress-parameters //Use for_each in dynamic to create 1 egress specification for each parameters
    content {
      from_port   = egress.value.from-port
      to_port     = egress.value.to-port
      protocol    = egress.value.protocol
      cidr_blocks = [egress.value.cidr-blocks]
    }
  }
```

Finally we add tags:

```
  tags = {
    "Name"    = var.SG-name
    "author"  = var.author
    "project" = var.project
  }
}
```

## Outputs

To be able to use the value of our new resource we need to output the value to use them in the Main.tf file.

```
output "security-group-id" {
    value = aws_security_group.security-group.id
}
output "security-group-arn" {
    value = aws_security_group.security-group.arn
}
```