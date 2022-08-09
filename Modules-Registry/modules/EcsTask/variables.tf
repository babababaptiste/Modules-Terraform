########################
#Date: 27/06/2022
#
# Application: Elactic-Subs-App
# Project: AWS-54
# SLA: Bronze
# Author: bfayty
#
#Descrition:
#Variables file for ECS Task
#
# Variables list :
# VARIABLE NAME             : DESCRIPTION                                                                   | TYPE
#---------------------------:-------------------------------------------------------------------------------|--------
# family                    : Name of the Task                                                              | String
# container_definitions     : List of valid container definitions provided as a single valid JSON document  | String
# execution_role_arn        : ARN of the associated IAM Role                                                | String
# network_mode              : Docker networking mode to use for the containers in the task                  | String
# memory                    : Amount (in MiB) of memory used by the task                                    | String
# requires_compatibilities  : Set of launch types required by the task                                      | String
# cpu                       : Number of cpu units used by the task                                          | String
# tags                      : Map of tags                                                                   | Map
###################################################
variable family                  {type = string}
variable container_definitions   {type = string}
variable execution_role_arn      {type = string}
variable network_mode            {type = string}
variable memory                  {type = string}
variable requires_compatibilities{type = string}
variable cpu                     {type = string}