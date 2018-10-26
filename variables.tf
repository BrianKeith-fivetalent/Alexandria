variable "aws_region" {}
variable "aws_profile" {}
data "aws_availability_zones" "avaiable" {}
variable "vpc_cidr" {}

variable "cidrs" {
        type = "map"
}

variable "localip" {}
variable "domain_name" {}