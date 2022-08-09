########################
#Date: 27/06/2022
#
# Application: Elactic-Subs-App
# Project: AWS-54
# SLA: Bronze
# Author: bfayty
#
#Descrition:
#Variables file for Eventbridge
#
# Variables list :
# VARIABLE NAME    : DESCRIPTION          | TYPE
#------------------:----------------------|--------
# eventbridge-name : Name of the resource |
# event-pattern    : Pattern of the event |
# target-id        : Id of the target     |
# target-arn       : Arn of the target    |
###################################################
variable eventbridge-name{type = string}
variable event-pattern{type = string}
variable target-id{type = string}
variable target-arn{type = string}