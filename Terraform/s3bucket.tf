resource "aws_s3_bucket" "sudos-duihua-s3bucket" {
  bucket = "sudos-duihua-s3bucket"
  force_destroy = true

  tags = {
    Name = "sudos-duihua-s3bucket"
  }
}
