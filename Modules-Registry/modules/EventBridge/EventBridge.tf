##################
# Date: 27/06/2022
# Author: bfayty
#
# Application: Elactic-Subs-App
# Project: AWS-54
# SLA: Bronze
# Author: bfayty
#
# Description:
# EventBridge rule to archive files for AWS-54
##################

resource "aws_cloudwatch_event_rule" "test"{
    name = var.eventbridge-name
    event_pattern = var.event-pattern
}


resource "aws_cloudwatch_event_target" "test2" {
    target_id = var.target-id
    rule = aws_cloudwatch_event_rule.test.name
    arn = var.target-arn
}