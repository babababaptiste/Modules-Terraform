resource "aws_kms_key" "mykey" {
  count = var.bucket-name == "" ? 0 : 1
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
  policy = file("./.terraform/modules/S3Backup/kmspolicy.json")
}

locals {
    bucketname = join("",aws_s3_bucket.mybucket[*].id)
}
locals {
    awsKmsKeyId = join("",aws_kms_key.mykey[*].arn)
}

resource "aws_s3_bucket" "mybucket" {
  count = var.bucket-name == "" ? 0 : 1
  bucket = var.bucket-name
  force_destroy = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "myconfiguration"{
  count = var.bucket-name == "" ? 0 : 1
  bucket = "${var.bucket-name != "" ?  var.bucket-name : local.bucketname}"
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = "${var.bucket-name != "" ?  "" : local.awsKmsKeyId}"
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_versioning" "myversioning"{
  count = var.bucket-name == "" ? 0 : 1
  bucket = "${var.bucket-name != "" ?  var.bucket-name : local.bucketname}"
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform-state" {
 name           = var.table-name
 read_capacity  = 5
 write_capacity = 5
 hash_key       = "LockID"

 attribute {
   name = "LockID"
   type = "S"
 }
}