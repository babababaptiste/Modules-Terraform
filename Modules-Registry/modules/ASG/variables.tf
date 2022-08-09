###################################################
# Author: bfayty Date: 10/05/2022
# Version : 1.1
#
# Description:
# Variables for AutoScalling Group
#
# Variables list :
# VARIABLE NAME                                    : DESCRIPTION                                 | TYPE
#--------------------------------------------------:---------------------------------------------|-------
# asg-name (AutoScalling Group)                    : Name for the AutoScalling Group             | String
# max (AutoScalling Group)                         : Max number of instance                      | Number
# min (AutoScalling Group)                         : Min number of instance                      | Number
# desired (AutoScalling Group)                     : Desired number of instance                  | Number
# launch-template-name                             : Name of the launch template                 | String
# target-group-arn                                 : ARN of the target group                     | String
###################################################
variable "asg-name"{type = string}
variable "subnets"{type = list(string)}
variable "max"{type = number}
variable "min"{type = number}
variable "desired"{type = number}
variable "launch-template-name"{type = string}
variable "target-group-arn"{type = string}
###Tags###
variable "instance-name" {type = string}