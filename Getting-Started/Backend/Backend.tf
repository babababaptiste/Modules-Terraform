###################################################
# Author: bfayty Date: 12/07/2022
# Version : 1.0
#
# Description:
# File to deploy a backend for your project
###################################################
module "S3Backup" {
  source = ""

  //Name for the backend bucket
  bucket-name = ""
  //Name for the backend dynamodb table
  table-name = ""
}