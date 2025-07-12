resource "aws_s3_bucket" "copilot_storage" {
  bucket = "copilot-storage-${random_id.bucket.hex}"
  force_destroy = true

  tags = {
    Environment = "dev"
    Project     = "copilot-multicloud"
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.copilot_storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}