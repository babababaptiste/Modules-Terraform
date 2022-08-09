# Terraform Modules for AWS

## About

This is a repository to store Terraform AWS modules.

Please use the "Getting-Started" repository to create your resources.


## How it works 

Terraform commands will directly use the configuration files in the current working directory. This configuration use module blocks to call modules in other directories. When Terraform encounters a module block, it loads and processes that module's configuration files.

Modules can either be loaded from the repository, or a remote source. Terraform supports a variety of remote sources, including the AWS CodeCommit Registry.

So this repository is where modules are stored and the "Getting-Started" repository is where you call your modules.

This provides more security and less chance to destroy or change modules code.

## Content of a module

### variables.tf

ModuleName/variables.tf is where your variables are instanciated.


### NameOfTheResource.tf

This file is where each resource is defined.

Don't modify this file.

### ReadMe.md

This file briefly explicate how the code is done and the action to perform on it.