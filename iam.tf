# IAM Policy for S3 Access
resource "aws_iam_policy" "s3_access_policy" {
  name        = "s3_access_policy"
  description = "Policy for allowing S3 access"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:GetBucketAcl",
        "s3:PutBucketAcl",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::my-simple-website-achshah-12345/*",
        "arn:aws:s3:::my-simple-website-achshah-12345",
        "arn:aws:s3:::my-simple-website-log-bucket-12345/*",
        "arn:aws:s3:::my-simple-website-log-bucket-12345"
      ]
    }
  ]
}
EOF
}

# IAM Role for CloudFront
resource "aws_iam_role" "cloudfront_role" {
  name = "cloudfront_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "cloudfront.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

# Attach Policies to IAM Role
resource "aws_iam_role_policy_attachment" "attach_s3_access_policy" {
  role       = aws_iam_role.cloudfront_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}