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
  name        = "sudos-duihua-app"
}
resource "aws_elastic_beanstalk_environment" "sudos-duihua-env" {
  name                = "sudos-duihua-env"
  application         = aws_elastic_beanstalk_application.sudos-duihua-app.name
  #load_balancers      = "my-aws-alb"
  solution_stack_name = "64bit Amazon Linux 2 v4.2.18 running Tomcat 8.5 Corretto 11"
  
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
  # setting {
  # namespace = "aws:ec2:vpc"
  # name = "VPCId"
  # value = aws_vpc.sudos-duihua-vpc.id
  # }
  # setting {
  # namespace = "aws:ec2:vpc"
  # name = "AssociatePublicIpAddress"
  # value = "true"
  # }

  # setting {
  # namespace = "aws:ec2:vpc"
  # name = "Subnets"
  # value = "subnet-0d2241b3ccb878e79 , subnet-0d28720feac0a59a4"
  # }
  # setting {
  #   namespace = "aws:autoscaling:launchconfiguration"
  #   name = "SecurityGroups"
  #   value = "sg-0dd8d7c90077354d8"
  # }
  # setting {
  # namespace = "aws:elasticbeanstalk:environment"
  # name = "EnvironmentType"
  # value = "LoadBalanced"
  # }
  # setting {
  # namespace = "aws:elasticbeanstalk:environment"
  # name = "LoadBalancerType"
  # value = "application"
  # }
  # # setting {
  # # namespace = "aws:elasticbeanstalk:environment"
  # # name = "LoadBalancerIsShared"
  # # value = "True"
  # # }
  # # setting {
  # # namespace = "aws:elbv2:loadbalancer"
  # # name = "SharedLoadBalancer"
  # # value = aws_lb.my-aws-alb.arn
  # # }
  # setting {
  # namespace = "aws:elbv2:listener:default"
  # name = "ListenerEnabled"
  # value = "true"
  # }
  # setting {
  # namespace = "aws:elasticbeanstalk:environment:process:default"
  # name = "Port"
  # value = 80
  # }
  # setting {
  # namespace = "aws:elasticbeanstalk:environment:process:default"
  # name = "Protocol"
  # value = "HTTP"
  # }
  # setting {
  # namespace = "aws:autoscaling:launchconfiguration"
  # name = "InstanceType"
  # value = var.instance_type
  # }
  # #setting {
  # #namespace = "aws:autoscaling:asg"
  # #name = "MinSize"
  # #value = {}
  # #}
  # # setting {
  # # namespace = "aws:autoscaling:asg"
  # # name = "MaxSize"
  # # value = {}
  # # }
  # setting {
  # namespace = "aws:elasticbeanstalk:healthreporting:system"
  # name = "SystemType"
  # value = "basic"
  # }

}

