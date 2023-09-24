# Create an S3 bucket to host the website
resource "aws_s3_bucket" "my_website_bucket" {
  bucket = "my-simple-website-achshah-12345"
  
  # Define website configuration for the bucket
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

# Create an S3 bucket for storing logs
resource "aws_s3_bucket" "my_log_bucket" {
  bucket = "my-simple-website-log-bucket-12345"
  
  # Grant permissions for log delivery
  grant {
    type        = "Group"
    uri         = "http://acs.amazonaws.com/groups/s3/LogDelivery"
    permissions = ["WRITE", "READ_ACP"]
  }
}

# Configure public access block settings for log bucket
resource "aws_s3_bucket_public_access_block" "my_log_bucket_access_block" {
  bucket = aws_s3_bucket.my_log_bucket.id
  
  block_public_acls   = false
  block_public_policy = false
}

# Upload index.html to the website bucket
resource "aws_s3_bucket_object" "website_index" {
  bucket = aws_s3_bucket.my_website_bucket.bucket
  key    = "index.html"
  source = "website-files/index.html"
  content_type = "text/html"
}

# Upload error.html to the website bucket
resource "aws_s3_bucket_object" "website_error" {
  bucket = aws_s3_bucket.my_website_bucket.bucket
  key    = "error.html"
  source = "website-files/error.html"
  content_type = "text/html"
}

# Output the website URL
output "website_url" {
  value = aws_s3_bucket.my_website_bucket.website_endpoint
  description = "The website endpoint URL"
}

# Attach a bucket policy for public read access to the website bucket
resource "aws_s3_bucket_policy" "my_website_bucket_policy" {
  bucket = aws_s3_bucket.my_website_bucket.id
  
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-simple-website-achshah-12345/*"
    }
  ]
}
POLICY
}

