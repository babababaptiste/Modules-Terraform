###################################################
# Date: 27/04/2022
# Version 1.0
#
# Application: Elactic-Subs-App
# Project: AWS-54
# SLA: Bronze
# Author: bfayty
#
# Description:
# 1 Elastic Container Service Cluster
###################################################
resource "aws_ecs_cluster" "elasticsubsappcluster" {
  name = var.name
}

output "clusterArn"{
  value = aws_ecs_cluster.elasticsubsappcluster.arn
}