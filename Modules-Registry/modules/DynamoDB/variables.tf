###################################################
# Author: bfayty Date: 11/05/2022
# Version 1.1
#
# Description:
# Variables for DynamoDB and Tags
#
# Variables list :
# VARIABLE NAME                 : DESCRIPTION                                                                            | TYPE
#-------------------------------:----------------------------------------------------------------------------------------|-------
# dynamodb-name (DynamoDB)      : Name for the DynamoDB table                                                            | String
# user-id (DynamoDB)            : ID of the User                                                                         | String
# primary-key-name (DynamoDB)   : Name of the primary key                                                                | String
# secondary-key-name (DynamoDB) : Name of the secondary key                                                              | String
# primary-key-type (DynamoDB)   : Type of the primary key                                                                | String
# secondary-key-type (DynamoDB) : Type of the secondary key                                                              | String
# read-capacity (DynamoDB)      : Read capacity for your table. S for String, N for number, B for binary                 | number
# write-capacity (DynaomDB)     : Write capacity for your table. S for String, N for number, B for binary                | number
# billing-mode (DynamoDB)       : Controls how you are charged for read and write throughput and how you manage capacity | String
# kms-key-arn (DynamoDB)        : kms key arn for the server side encryption                                             | String
# ttl-enabled (DynamoDB)        : time to live. True to able                                                             | bool
###################################################
###DynamoDB###
variable "dynamodb-name" {type = string}
variable "user-id" {type = string}
variable "primary-key-name" {type = string}
variable "secondary-key-name" {type = string}
variable "primary-key-type" {type = string}
variable "secondary-key-type" {type = string}
variable "read-capacity" {type = number}
variable "write-capacity" {type = number}
variable "billing-mode" {type = string}
variable "kms-key-arn" {type = string}
variable "ttl-enabled" {type = bool}