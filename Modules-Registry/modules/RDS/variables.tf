###################################################
# Author: bfayty Date: 11/05/2022
# Version 1.1
#
# Description:
# Variables for DBInstance, DBSubnet, Parameter group and Providers
#
# Variables list :
# VARIABLE NAME                        : DESCRIPTION                                                                  | TYPE
#--------------------------------------:------------------------------------------------------------------------------|-------
# db-instance-name (DB Instance)       : Name for your instance                                                       | String
# allocated-storage (DB Instance)      : Allocated storage for the instance                                           | number
# engine (DB Instance)                 : Engine used for the data base                                                | String
# engine-version (DB Instance)         : Version of the engine                                                        | String
# instance-class (DB Instance)         : Type of instance to use                                                      | String
# username (DB Instance)               : Username for the user of RDS                                                 | String
# password (DB Instance)               : Password for the user of RDS                                                 | String
# skip-final-shot (DB Instance)        : To enable a snapshot before closing, set on false                            | bool
# db-subnet-name (DB Subnet)           : Subnet name                                                                  | String
# subnet-id1 (DB Subnet)               : Id of the existing subnet                                                    | String
# subnet-id2 (DB Subnet)               : Id of the existing subnet in a different AZ                                  | String
# db-pg-name (DB Parameter Group)      : Name of the parameter group                                                  | String
# parameter-name (DB Parameter Group)  : Name of the parameter                                                        | String
# parameter-value (DB Parameter Group) : Value of the parameter                                                       | String
# engine-family (DB Parameter Group)   : Engin family = engine name + engine version (Ex for mysql 5.7 -> 'mysql5.7') | String
###################################################
###DB Instance###
variable "db-name" {type = string}
variable "allocated-storage" {type = number}
variable "engine" {type = string}
variable "engine-version" {type = string}
variable "instance-class" {type = string}
variable "username" {type = string}
variable "password" {type = string}
variable "skip-final-shot" {type = bool}
###DB Subnet###
variable "db-subnet-name" {type = string}
variable "subnet-id1" {type = string}
variable "subnet-id2" {type = string}
###DB Parameter Group###
variable "db-pg-name" {type = string}
variable "parameter-name" {type = string}
variable "parameter-value" {type = string}
variable "engine-family" {type = string}