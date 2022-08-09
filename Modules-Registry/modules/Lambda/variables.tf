########################
# Date: 24/06/2022
#
# Application: Elactic-Subs-App
# Project: AWS-54
# Environment: Production
# SLA: Bronze
# Author: bfayty
#
#Descrition:
#Variables file for Lambda.terraform
#
# Variables list :
# VARIABLE NAME             : DESCRIPTION                           | TYPE
#---------------------------:---------------------------------------|-------
# function_name (Lambda)    : Name of the function                  | String
# role          (Lambda)    : ARN of the associated role            | String
# runtime       (Lambda)    : Identifier of the function's runtime  | String
# handler       (Lambda)    : Entry point of the function           | String
###################################################
variable function_name{type = string}
variable role         {type = string}
variable runtime      {type = string}
variable handler      {type = string}
variable filename     {type = string}
variable timeout      {type = string}