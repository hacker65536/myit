#Description
#sample terraform
# @hacker65536


#------------variable

#region = oregon
variable "aws_region" {
        default = "us-west-2"
}
variable "tagname" {
        default = "terraformtest"
}
variable "instancetype" {
        default = "t2.micro"
}

#Amazon Linux AMI 2015.09.2 (HVM), SSD Volume Type
variable "aws_amis" {
        default = {
                "us-east-1"= "ami-8fcee4e5"
                "us-west-2"= "ami-63b25203"
        }
}


#------------provider aws 

provider "aws" {
        region= "${var.aws_region}"
}


#------------resources

resource "aws_vpc" "main" {
        cidr_block = "10.2.0.0/16"
        tags = {
                Name ="${var.tagname}"
        }
}
resource "aws_subnet" "main" {
        cidr_block ="10.2.0.0/24"
        vpc_id ="${aws_vpc.main.id}"
}
resource "aws_instance" "web" {
    instance_type = "${var.instancetype}"
                ami = "${lookup(var.aws_amis, var.aws_region)}"
                subnet_id = "${aws_subnet.main.id}"
}
