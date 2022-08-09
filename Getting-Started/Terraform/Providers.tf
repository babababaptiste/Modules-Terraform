###################################################
# Author: bfayty 
# Date: 18/05/2022
# Version 1.0
#
# Description:
# Providers for AWS and Terraform
###################################################
terraform {
  backend "s3" {
    # Type the name of the bucket you choose in the backend configuration 
    bucket         = ""
    # Type the name of the dynamodb table you choose in the backend configuration 
    dynamodb_table = ""
    # Type: name_of_your_project/terraform.tfstate
    key            = "/terraform.tfstate"
    # Name of the region
    region         = "us-west-2"
  }
}
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