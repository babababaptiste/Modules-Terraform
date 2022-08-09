# DynamoDB Terraform

This code enables you to create a new DynamoDB table.

## Terraform

In this part we will see how to set up and deploy aws DynamoDB table on Terraform.

For more informations : [Terraform DynamoDB table documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table)

### DynamoDB

The first part of the resource is were we define:
    - The name of the table
    - The billing mode
    - The read capacity
    - The write capacity
    - The primary key
    - The secondary key

```
resource "aws_dynamodb_table" "DynamoDBTable" {
  name           = var.dynamodb-name
  billing_mode   = var.billing-mode
  read_capacity  = var.read-capacity
  write_capacity = var.write-capacity
  hash_key       = var.primary-key-name
  range_key      = var.secondary-key-name
  ```

Then we add attributes to these keys:
```
  attribute {
    name = var.primary-key-name
    type = var.primary-key-type
  }

  attribute {
    name = var.secondary-key-name
    type = var.secondary-key-type
  }
```

We define the server side encryption and the time to live:
```
server_side_encryption { 
    enabled = true 
    kms_key_arn = var.kms-key-arn
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = var.ttl-enabled
  }
```

We add tags:
```
tags = {
        "name"    = var.dynamodb-name
        "author"  = var.author
        "project" = var.project-name
    }
```

## Outputs

To be able to use the value of our new resource we need to output the value to use them in the Main.tf file.
```
output "DynamoDBId" {
  value = aws_dynamodb_table.DynamoDBTable.id
}

output "DynamoDBARN" {
  value = aws_dynamodb_table.DynamoDBTable.arn
}
```