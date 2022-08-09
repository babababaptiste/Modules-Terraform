###################################################
# Author: bfayty Date: 11/05/2022
# Version 1.1
#
# Description:
# Variables for EC2 and Tags
#
# Variables list :
# VARIABLE NAME                      : DESCRIPTION                                   | TYPE
#------------------------------------:-----------------------------------------------|-------
# security-group-id (Security group) : Id of the security group                      | String
# ami-request (AMI)                  : AMI name to request (if AMI id is not set)    | String
# ami-id (AMI)                       : Id of the AMI                                 | String
# instance_type (EC2)                : Type of instance to launch                    | String
# instance-name (EC2)                : Name for the instance                         | String
# keyName (EC2)                      : Name of the key pair                          | String
# AssociatePublicIp (EC2)            : Wether to associate a public ip address       | Bool
# subnet_id (EC2)                    : Id of the subnet                              | String
###################################################
###Security group###
variable "security-group-id" {type = string}
###AMI###
variable "ami-request" {type = string}
variable "ami-id"      {type = string}
###EC2###
variable "instance_type" {type = string}
variable "instance-name" {type = list(string)}
variable "keyName"       {type = string}
variable "subnet_id"     {type = string}
variable "AssociatePublicIp" {type = bool}