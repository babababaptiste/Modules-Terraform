# EC2

This file create and launch an EC2 instance.

## Resource data aws_ami

This goal of this part is to assign an AWS AMI to the Instance if you don't have one.

The first part of the code verify if you typed an AMI.

To translate the code, if there is no value in var.ami-id then the count is set on 1 and will perform the action. 

```
count = var.ami-id == "" ? 1 : 0
```
Then we apply some filter to find the best AMI:
```
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
```

## resource aws_instance

This part creates an EC2 instance.

- This is where we defined:
    - the type of instance

    - the id of the ami (The result of the search or the id you typed)

    - the id of the security group

    - the id of the subnet

    - the name of the key pair to assign to your instance

    - set "true" to associate a public ip address

    - the tags


## Outputs

To be able to use the value of our new EC2 we need to output the value to use them in the Main.tf file.

```
output "InstanceId" {
  value = aws_instance.Instance.id
}

output "InstanceAMI" {
  value = aws_instance.Instance.ami
}

output "InstanceARN" {
  value = aws_instance.Instance.arn
}

output "InstanceIP" {
  value = aws_instance.Instance.public_ip
}
```