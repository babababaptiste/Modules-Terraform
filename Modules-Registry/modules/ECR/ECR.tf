###################################################
# Date: 27/06/2022
# Version 1.0
#
# Application: Elactic-Subs-App
# Project: AWS-54
# SLA: Bronze
# Author: bfayty
#
# Description:
# 1 Elastic Container Service Repository
###################################################
resource "aws_ecr_repository" "ECR" {
  name = var.name
}