#set provider to AWS in declared region (europe west2)
provider "aws" {
	region = var.aws_region
}