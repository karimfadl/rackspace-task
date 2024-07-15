resource "aws_s3_bucket" "apache_logs" {
  bucket = var.s3_apache_logs
}

resource "aws_s3_bucket_lifecycle_configuration" "l1" {
  bucket = aws_s3_bucket.apache_logs.id
  rule {
    status = "Enabled"
    id     = "expire_all_files"
    expiration {
        days = 30
    }
  }
}
