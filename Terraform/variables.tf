#set region to europe west2
variable "aws_region" {
	default = "eu-west-2"
}

variable "vpc_cidr" {
	default = "10.0.0.0/16"
}

variable "subnets_cidr" {
	type = list
	default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
	type = list
	default = ["eu-west-2", "eu-west-2a"]
}

#ami is the information required for the launch of the instance
variable "webservers_ami" {
  default = "ami-0ff8a91507f77f867"
}

#creates instance with type t2 nano
variable "instance_type" {
  default = "t2.nano"
}