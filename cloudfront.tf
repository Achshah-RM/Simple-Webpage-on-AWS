# Create CloudFront distribution for the website
resource "aws_cloudfront_distribution" "my_cloudfront_distribution" {
  # Define S3 origin
  origin {
    domain_name = aws_s3_bucket.my_website_bucket.bucket_regional_domain_name
    origin_id   = "myS3Origin"

    # CloudFront origin access identity for secure access to S3
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  # Enable CloudFront and IPv6
  enabled             = true
  is_ipv6_enabled     = true  // Enables IPv6 for additional availability and reach
  default_root_object = "index.html"

  # Default cache behavior settings
  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "myS3Origin"

    # Forwarding settings
    forwarded_values {
      query_string = false
      headers      = ["Origin"]
      
      cookies {
        forward = "none"
      }
    }

    # Enforce HTTPS
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # No geographical restrictions
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  # Use default CloudFront certificate
  viewer_certificate {
    cloudfront_default_certificate = true
  }

  # Logging settings
  logging_config {
    include_cookies = false
    bucket          = "my-simple-website-log-bucket-12345.s3.amazonaws.com"
    prefix          = "cf-logs/"
  }

  # Define tags for the CloudFront distribution
  tags = {
    Environment = "production"
    Project     = "my_simple_website"
  }
}

# Create origin access identity for secure S3 access
resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "cloudfront-origin-access-identity"
}


