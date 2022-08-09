###################################################
# Author: bfayty Date: 10/05/2022
# Version : 1.1
#
# Description:
# Variables for Key Pair, Secrets Manager, public/private keys and Providers
#
# Variables list :
# VARIABLE NAME                         : DESCRIPTION                                | TYPE
#---------------------------------------:--------------------------------------------|-------
# secretsManagerName (Secrets Manager)  : Name of the secret                         | String
# key-algo (public/private keys)        : Algorithm of the keys                      | String
# keyName (Key Pair)                    : Name of the Key Pait                       | String
###################################################
variable "secretsManagerName" {type = string}
variable "key-algo" {type = string}
variable "keyName" {type = string}