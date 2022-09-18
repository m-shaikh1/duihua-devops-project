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
locals {
  origin_id = "duihua-devops-project-cf" 
}

resource "aws_cloudfront_distribution" "distribution" {
  origin {
    domain_name = var.cname
    origin_id   = local.origin_id

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1"]
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "This is Duihua Application from ElasticBeanstalk"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name = "sudos-duihua-cloudfront"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}