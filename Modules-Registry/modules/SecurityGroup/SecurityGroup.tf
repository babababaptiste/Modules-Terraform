###################################################
# Author: bfayty Date: 02/05/2022
# Version : 1.0
#
# Description:
# 1 Security Group
###################################################

//Security Group creation
resource "aws_security_group" "security-group" {
    
  name        = var.SG-name
  description = var.SG-description
  vpc_id      = var.vpc-id
    
  //Ingress specifications
  dynamic "ingress" { 
    for_each = var.ingress-parameters //Use for_each in dynamic to create 1 egress specification for each parameters
    content {
      from_port   = ingress.value.from-port
      to_port     = ingress.value.to-port
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.cidr-blocks]
    }
  }

    //Egress specifications
  dynamic "egress" { 
    for_each = var.egress-parameters //Use for_each in dynamic to create 1 egress specification for each parameters
    content {
      from_port   = egress.value.from-port
      to_port     = egress.value.to-port
      protocol    = egress.value.protocol
      cidr_blocks = [egress.value.cidr-blocks]
    }
  }
    
  tags = {
    "Name"    = var.SG-name
  }
}

//Output the value to use them in the root file
output "security-group-id" {
    value = aws_security_group.security-group.id
}
output "security-group-arn" {
    value = aws_security_group.security-group.arn
}