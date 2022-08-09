###################################################
# Author: bfayty Date: 10/05/2022
# Version 1.1
#
# Description:
# Variables for S3 Bucket, Access Control List and Providers
#
# Variables list :
# VARIABLE NAME               : DESCRIPTION                                                                      | TYPE
#-----------------------------:----------------------------------------------------------------------------------|-------
# bucket-name (Bucket)        : Name of the bucket                                                               | String
# kms_master_key_id (KMS Key) : Id of your kms key. If you want to create a new key leave this variable empty    | String
# sse_algorithm (KMS Key)     : The server-side encryption algorithm to use. Valid values are AES256 and aws:kms | String
###################################################
###Bucket###
variable "bucket-name" {type = string}
###KMS Key###
variable "kms_master_key_id" {type = string}
variable "sse_algorithm" {type = string}