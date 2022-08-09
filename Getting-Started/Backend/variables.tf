###################################################
# Author: bfayty Date: 18/07/2022
# Version : 1.0
#
# Description:
# Variables for Providers, Tags
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
