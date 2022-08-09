###################################################
# Author: bfayty Date: 10/05/2022
# Version : 1.1
#
# Description:
# Variables for Load Balancer, LB Listener, LB Target Group, AutoScalling Group, Launch Template and Providers
#
# Variables list :
# VARIABLE NAME                                    : DESCRIPTION                                 | TYPE
#--------------------------------------------------:---------------------------------------------|-------
# lb-name (Load Balancer)                          : Name for your Load Balancer                 | String
# load-balancer-type (Load Balancer)               : Type of Load Balancer(Network for this one) | String
# subnets (Load Balancer)                          : Id of the 2 Subnets                         | list(String)
# lb-port-listener (Load Balancer Listener)        : Port for the Listener                       | Number
# lb-protocol-listener (Load Balancer Listener)    : Protocol for the Listener                   | String
# lb-listener-action-type (Load Balancer Listener) : Action to perform for the Listener          | String
# lb-port-target (Load Balancer Listener)          : Port for the Target Group                   | Number
# lb-protocol-target (Load Balancer Target Group)  : Protocol for the Target Group               | String
# lb-tg-group (Load Balancer Target Group)         : Name for the Target Group                   | String
# vpc-id (Load Balancer Target Group)              : Id of your VPC                              | String
###################################################
###Load Balancer###
variable "lb-name" {type = string}
variable "load-balancer-type" {type = string}
variable "subnets" {type = list(string)}
###Load Balancer Listener###
variable "lb-port-listener" {type = number}
variable "lb-protocol-listener" {type = string}
variable "lb-listener-action-type" {type = string}
###Load Balancer Target Group###
variable "lb-port-target" {type = number}
variable "lb-protocol-target" {type = string}
variable "lb-tg-group" {type = string}
variable "vpc-id" {type = string}