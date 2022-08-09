###################################################
# Author: bfayty Date: 10/05/2022
# Version : 1.0
#
# Description:
# Variables for Providers, Tags and common values
#
###################################################
###Providers###
variable "region" {
    description = "Name of your region (us-west-2 for Oregon)"
    type = string
    default = "us-west-2"
}
###Tags###
variable tags {
    type = map
    default = {
        Author = ""
        Project = ""
    }
}

###Common Variables###
variable "VPC-id" {
    description = "Id of your VPC"
    type = string
    default = ""
}

variable "Subnets-id" {
    description = "Id of your subnet"
    type = list(string)
    default = [""] //You can add multiple subnets in the list: ["YourSubnetID0", "YourSubnetID1", "YourSubnetID2"]
    // To use them in the Main.tf file type: var.Subnets-id[0] ;change 0 by the Subnet you want to use (The first on the list is 0 then 1...)
}