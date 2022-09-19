resource "aws_s3_bucket" "project-s3bucket" {
  bucket = "mshaikh-project-s3bucket" //Change the name of the S3Bucket here to be unique (All small letters) ///
  force_destroy = true

  tags = {
    Name = "project-s3bucket"
  }
}
