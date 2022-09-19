output "eb-cname" {
  value= aws_elastic_beanstalk_environment.Elasticbeanstalk-env.cname
}
output "cf_domain_name" {
  description = "The CloudFront domain name."
  value       = aws_cloudfront_distribution.distribution.domain_name
}