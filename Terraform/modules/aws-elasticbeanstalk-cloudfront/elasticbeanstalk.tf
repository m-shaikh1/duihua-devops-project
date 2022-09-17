terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.18.0"
    }
  }
}

provider "aws" {

  region = "us-east-1"

}
resource "aws_elastic_beanstalk_application" "sudos-duihua-app" {
  name        = var.eb-app-name
}
resource "aws_elastic_beanstalk_environment" "sudos-duihua-env" {
  name                = var.eb-env-name
  application         = aws_elastic_beanstalk_application.sudos-duihua-app.name
  solution_stack_name = var.eb-solution-stack-name
  
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
}
