locals {
  origin_id = aws_elastic_beanstalk_environment.sudos-duihua-env.load_balancers[0]
}

resource "aws_cloudfront_distribution" "distribution" {
  origin {
    domain_name = aws_elastic_beanstalk_environment.sudos-duihua-env.cname
    origin_id   = local.origin_id

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "match-viewer"
      origin_ssl_protocols   = ["TLSv1"]
    }

    #s3_origin_config {
    # origin_access_identity = "origin-access-identity/cloudfront/ABCDEFG1234567"
    #}
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "This is Duihua Application from ElasticBeanstalk"
  default_root_object = "index.html"


  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
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
  # depends_on = [
  #   aws_elastic_beanstalk_environment.sudos-duihua-env
  # ]
}