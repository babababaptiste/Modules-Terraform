# Terraform Backend Configuration

## About

This part is used to create the backend configuration to allow you to store the backend in a S3 bucket.


## How it works 

This module launch a S3 bucket with a dynamodb table to use to store your backend configuration.

You don't need 1 bucket per project as each backend file is stored in a different folder so if a Terraform backend bucket already exists in your account, skip this part.