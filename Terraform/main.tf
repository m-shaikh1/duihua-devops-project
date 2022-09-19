terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.18.0"
    }
  }
}

provider "aws" {

  region = var.REGION

}

module "vpc" {
  source = "./modules/aws-vpc"

}

module "key" {
  source = "./modules/aws-ec2-key"

}

module "ec2" {
  source = "./modules/aws-ec2"
  depends_on = [
    module.vpc
  ]

  subnet_id = module.vpc.aws_subnet
  vpc_security_group_ids = module.vpc.aws_security_group
  key_name = module.key.aws_key_pair
  AWS_ACCESS_KEY_ID = var.AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY = var.AWS_SECRET_ACCESS_KEY
  AWS_REGION = var.AWS_REGION
}

module "s3bucket" {
  source = "./modules/aws-s3bucket"

}