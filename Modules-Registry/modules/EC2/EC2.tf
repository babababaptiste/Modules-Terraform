###################################################
# Author: bfayty Date: 26/04/2022
# Version : 1.0
#
# Description:
# 1 EC2 with 1 AMI and 1 Key Pair 
###################################################

//Function to find an Amazon AMI
data "aws_ami" "ami-id" {
  count = var.ami-id == "" ? 1 : 0
  filter {
    name   = "name"
    values = [var.ami-request]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  most_recent = true
  owners      = ["amazon"]
}

//EC2 instance creation
resource "aws_instance" "Instance" {
  for_each = toset(var.instance-name)

  instance_type               = var.instance_type
  ami                         = var.ami-id
  vpc_security_group_ids      = [var.security-group-id] 
  subnet_id                   = var.subnet_id
  key_name                    = var.keyName
  associate_public_ip_address = var.AssociatePublicIp
  tags = {
        Name = "instance-${each.key}"
    }
}

//Output the value to use them in the root file
output "InstanceId" {
  value = [ for instance in aws_instance.Instance: instance.id]
}

output "InstanceAMI" {
  value = [ for instance in aws_instance.Instance: instance.ami]
}

output "InstanceARN" {
  value = [ for instance in aws_instance.Instance: instance.arn]
}

output "InstanceIP" {
  value = [ for instance in aws_instance.Instance: instance.public_ip]
}