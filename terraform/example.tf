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
#use role of IAM
#access_key = "ACCESS_KEY_HERE"
#secret_key = "SECRET_KEY_HERE"
        region= "${var.aws_region}"
}


#------------resources

resource "aws_vpc" "main" {
        cidr_block = "10.2.0.0/16"
        tags = {
                Name ="${var.tagname}"
        }
}

resource "aws_internet_gateway" "gw" {
        tags = {
                Name ="${var.tagname}"
        }
        vpc_id ="${aws_vpc.main.id}"
}

resource "aws_route" "r" {
        route_table_id = "${aws_vpc.main.main_route_table_id}"
        destination_cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"

}

resource "aws_subnet" "main" {
        cidr_block ="10.2.0.0/24"
        vpc_id ="${aws_vpc.main.id}"
}

resource "aws_instance" "web" {
        instance_type = "${var.instancetype}"
        ami = "${lookup(var.aws_amis, var.aws_region)}"
        subnet_id = "${aws_subnet.main.id}"
        key_name = "${aws_key_pair.deployer.key_name}"
        associate_public_ip_address = "true"
}

resource "aws_key_pair" "deployer" {
  key_name = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbBSE/z361UxmjfaPfbewAPsgl0Snw7ioSzhgjV+nLVLXn8izD8NZXJvkZHYtywJxPs2QdFwD2hclYRi+4Er5tdomC5oprVOo8cRu8a/vZqseaSiUg/DibJ/Ud7pIgFqi78fKZs5RVGraYd+8ZeSdbvMXx63pB4a2KdSIgqMLZFEtjBh7oJfsLjo6/vt8jf7iXnin+eZvvxNpNTIeuladU7X3GR7MFb7uVQ5UGJLuWvlbcZpmrEKd+pMbPpMcCH+Q+AMvVXxBubZ7GCXcGkUWRD3En58m+koRfK3cT70rhC1E7impVf1VdtuALnqe/L+2nWtMCMxd81ucfSuBkL5TV"
}
