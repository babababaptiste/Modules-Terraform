###################################################
# Author: bfayty 
# Date: 18/05/2022
# Version 1.0
#
# Description:
# Providers for AWS and Terraform
###################################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}
provider "aws" {
    region     = var.region
    default_tags {
      tags = var.tags
    }
}