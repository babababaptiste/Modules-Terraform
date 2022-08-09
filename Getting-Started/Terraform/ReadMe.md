# Terraform Modules for AWS

## About

This is a Toolbox to create aws structures using Terraform modules.

This repository gives you all you need to launch your resources.

The "Modules-Registry" repository is where all the resources code are located.

## Configuration

If you use AWS Cloud9 you can skip configurations as git and aws cli are already configured.

### Configure git

- Install [git](https://git-scm.com/downloads) on your computer.

- [Set up your git credentials](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html)


### Configure your AWS CLI

- Run this command on your terminal to configure your AWS CLI :
```
aws configure
```

Then enter the corresponding informations 

```
AWS Access Key ID [None]: 
AWS Secret Access Key [None]: 
Default region name [None]: 
Default output format [None]: 
```

## How it works 

Terraform commands will directly use the configuration files in the current working directory. This configuration use module blocks to call modules in other directories. When Terraform encounters a module block, it loads and processes that module's configuration files.

Modules can either be loaded from the repository, or a remote source. Terraform supports a variety of remote sources, including the AWS CodeCommit Registry.

In this case we will only use remote source.

- Clone this repository to your environnement:
  - Run the command:
  ```
  git clone https://git-codecommit.us-west-2.amazonaws.com/v1/repos/Getting-Started
  ```

Once the repository is cloned you can start using it.

### Main.tf

This file is were you call your modules.

On each resource folder located on the "modules" folder you'll wind a modules.txt file.

For example to create a key pair you have to follow this path :

Getting-Started\Modules-Templates\SecretManager.txt

Then copy the content of the file in Main.tf

Then fill all the module variables following their description.

For example:

```
module "SecretManager" {
  source = "./modules/Secret Manager"

  //Name of the secret
  secretsManagerName = "NewSecret"
  //Algorithm of the keys (RSA)
  key-algo = "RSA"
  //Name of your key pair
  keyName = "NewKey"

  //Possible outputs: public-key, key-name, SecretName
}
```

You can also use other modules value.

For example: when creating an EC2 instance and a Security Group you can use the id of the Security group for your instance.

All you have to do is specify it in the value of the corresponding variable.

In EC2 module for the "security-group-id" variable, type:

```
security-group-id = modules.SecurityGroup.security-group-id
```

(variable) = modules.(Name of the module).(Name of the output)

You can see all possible outputs at the end of each module.

### variables.tf

In Modules-Terraform/variables.tf, enter common variables for all the modules (Author, Project name, VPC id and Subnets Id).

### Providers.tf

This file install the providers for AWS and Terraform.

Enter for the bucket and dynamodb table the configuration you applied in the backend configuration.

For the key, type the name of your project + "/terraform.tfstate"

```
terraform {
  backend "s3" {
    # Type the name of the bucket you choose in the backend configuration 
    bucket         = ""
    # Type the name of the dynamodb table you choose in the backend configuration 
    dynamodb_table = ""
    # Type: name_of_your_project/terraform.tfstate
    key            = "/terraform.tfstate"
    # Name of the region
    region         = "us-west-2"
  }
}
```

## Content of a module template

### module.txt

This file is a template that launch the corresponding resource.

Copy the content of this file in Main.tf and assign value for each variable.

At the beggining of the file the "source" variable specifiy where the resource code is located.

As the code is located on another repository don't modify the source.

## Launch the configuration

Once you performed all these steps, run:

```
terraform init
```
This will load your modules and Providers.

Then:
```
Terraform apply
```
This will show you the plan of your configuration.

If the plan correspond to your needs type "yes" to apply and launch the configuration.

## Save your configuration

Once you've launch your resources Terraform will create a terraform.tfstate file.

This file is very important as it keeps in memory all your configuration and values.

This file is stored in the S3 you created in the backend resources.