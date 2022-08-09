###################################################
# Author: bfayty Date: 16/05/2022
# Version 1.0
#
# Description:
# Variables for Security group
#
# Variables list :
# VARIABLE NAME                       : DESCRIPTION                                         | TYPE
#-------------------------------------:-----------------------------------------------------|-------
# vpc-id (VPC)                        : Id of the VPC                                       | String
# SG-name (Security group)            : Name for the security group                         | String
# SG-description (Security group)     : Description for the security group                  | String
# private_ip_address (Security group) : Private IP address                                  | String
# egress-parameters (Security group)  : Specifications for the egress                       | Map
# ingress-parameters (Security group) : Specifications for the ingress                      | Map
###################################################
###VPC###
variable "vpc-id" {type = string}
###Security group###
variable "SG-name"            {type = string}
variable "SG-description"     {type = string}
variable "private_ip_address" {type = string}
variable "egress-parameters" {
    type = map(object({
    from-port   = number
    to-port     = number
    protocol    = string
    cidr-blocks = string 
  }))
}
variable "ingress-parameters" {
    type = map(object({
    from-port   = number
    to-port     = number
    protocol    = string
    cidr-blocks = string 
  }))
}