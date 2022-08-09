###################################################
# Date: 27/04/2022
# Version 1.0
#
# Application: Elactic-Subs-App
# Project: AWS-54
# Environment: Production
# SLA: Bronze
# Author: bfayty
#
# Description:
# 1 Lambda function with source code store in S3 bucket
###################################################
resource "aws_lambda_function" "test_lambda" {
  function_name = var.function_name
  role          = var.role
  handler       = var.handler
  runtime       = var.runtime
  filename      = var.filename
  timeout       = var.timeout
}

output "ArnLamba"{
  value = aws_lambda_function.test_lambda.arn
}