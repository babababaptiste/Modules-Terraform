# RDS Terraform

## About

This code enable you to create a new relational database.

### Terraform 

In this part we will see how to set up and deploy aws relationnal database service

For more informations : [Terraform RDS documentations](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance)

### RDS

1. RDS.tf file

This file creates a new relational database instance, a new data base subnet and a new parameter group.

2. variables.tf file

Type your access key and secret key in the default variable section.

```
variable "access_key" {
    type      = string
    default   = "*********" //Access Key ID
    sensitive = true
}

variable "secret_key" {
    type      = string
    default   = "***********************" //Secret Access Key
    sensitive = true
}
```

- For the parameter-name and parameter-value you can specify how your database is configure.

- In the engine-family variable type the name of your engine and his version. Example for mysql version 5.7 the engine family is msql5.7

- For all the other variables follow the variable description to fill.