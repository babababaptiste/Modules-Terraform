###################################################
# Author: bfayty Date: 10/05/2022
# Version : 1.1
#
# Description:
# Variables for Launch Template
#
# Variables list :
# VARIABLE NAME                                    : DESCRIPTION                                 | TYPE
#--------------------------------------------------:---------------------------------------------|-------
# lt-name (Launch Template)                        : Name for the launch template                | String
# image-id (Launch Template)                       : AMI id for the instance                     | String
# instance-type (Launch Template)                  : Type of instance                            | String
# security-group (Launch Template)                 : Id of the Security Groups                   | String
# device-name (Launch Template)                    : Name of your device                         | String
# volume-type (Launch Template)                    : Type of the volume                          | String
# volume-size (Launch Template)                    : Size of the volume (GiB)                    | Number
# kms-key-arn (Launch Template)                    : ARN of the KMS key                          | String
# key-name (Launch Template)                       : Name of your Key Pair                       | String
###################################################
###Launch Template###
variable "lt-name" {type = string}
variable "image-id" {type = string}
variable "instance-type" {type = string}
variable "security-group" {type = string}
variable "key-name" {type = string}
variable "kms-key-arn" {type = string} 
variable "device-name" {type = string}
variable "volume-size" {type = number}
variable "volume-type" {type = string}
variable "instance-name" {type = string}