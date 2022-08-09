###################################################
# Date: 07/07/2022
#
# Application: Elactic-Subs-App
# Project: AWS-54
# Environment: Production
# SLA: Bronze
# Author: bfayty
#
# Description:
# 1 CodeCommit repository
###################################################
resource "aws_codecommit_repository" "testRepository" {
  repository_name = var.repository-name
  default_branch  = var.default-branch-name

}