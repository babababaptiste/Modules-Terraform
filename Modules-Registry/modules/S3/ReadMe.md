# S3 Bucket

This file creates a S3 bucket and an access control list using an existing kms key or creating one.

## resource aws_s3_bucket

This resource creates a S3 Bucket

- In this part we define:
    - the name of the bucket
    - the tags

```
resource "aws_s3_bucket" "bucket" {
    bucket = var.bucket-name

    tags = {
        "name"    = var.bucket-name
        "author"  = var.author
        "project" = var.project-name
    }
}
```

## resource aws_s3_bucket_acl

This resource creates a private access control list for the bucket

- We define!
    - the bucket
    - the private value
```
resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.bucket.bucket
  acl    = "private"
}
```

## resource aws_kms_key

This resource creates a kms key if you don't have one

The first part of the code verify if you typed akms key.

To translate the code, if there is no value in var.kms_master_key_id then the count is set on 1 and will perform the action. 
```
resource "aws_kms_key" "new-key" {
    count = var.kms_master_key_id == "" ? 1 : 0
    description = "kms key for s3 bucket"
}
```

As we use the 'count' we need to store localy the value of the key to use it.

```
locals {
    awsKmsKeyId = join("",aws_kms_key.new-key[*].arn)
}
``` 

## resource aws_s3_bucket-server_side_encryption_configuration

In this part we encrypt the bucket by applying the kms key and an sse algorithm

- We define:
    - the bucket
    - the id of the kms key
    - the sse algorithm

```
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket-sse" {
    bucket = aws_s3_bucket.bucket.bucket

    rule {
        apply_server_side_encryption_by_default {
            kms_master_key_id = "${var.kms_master_key_id != "" ?  var.kms_master_key_id : local.awsKmsKeyId}"
            sse_algorithm     = var.sse_algorithm
        }
    }
}
```

## Outputs

To be able to use the values of our new resources we need to output the value to use them in the Main.tf file.

```
output "S3Name" {
    value = aws_s3_bucket.bucket.bucket_domain_name
}
output "S3ARN" {
    value = aws_s3_bucket.bucket.arn
}
output "S3Id" {
    value = aws_s3_bucket.bucket.id
}

output "KMSId" {
    value = local.awsKmsKeyId
}
```