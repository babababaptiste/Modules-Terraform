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
# 1 Elastic Container Service Task
###################################################
resource "aws_ecs_task_definition" "service" {
  family                   = var.family
  container_definitions    = var.container_definitions
  execution_role_arn       = var.execution_role_arn
  network_mode             = var.network_mode
  memory                   = var.memory
  cpu                      = var.cpu
  task_role_arn            = var.execution_role_arn
  requires_compatibilities = [var.requires_compatibilities]
}