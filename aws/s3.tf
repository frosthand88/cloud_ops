resource "random_id" "bucket_id" {
  count   = var.enable_s3 ? 1 : 0
  byte_length = 4
}

resource "aws_s3_bucket" "example" {
  count   = var.enable_s3 ? 1 : 0
  bucket = "my-terraform-${random_id.bucket_id[0].hex}"  # use a globally unique name
  acl    = "private"

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}