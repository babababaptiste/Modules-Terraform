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

## Backend 

This folder is used to create the backend configuration for your project.

If a backend bucket exists in your account you can skip this part and go to Terraform folder.

## Terraform

This folder is used to launch your resources.