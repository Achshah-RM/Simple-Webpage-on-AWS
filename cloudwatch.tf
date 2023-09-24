# Create a CloudWatch dashboard
resource "aws_cloudwatch_dashboard" "my_dashboard" {
  dashboard_name = "my_dashboard"

  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [ "AWS/S3", "NumberOfObjects", "BucketName", "my-simple-website-achshah-12345" ]
        ],
        "view": "timeSeries",
        "stacked": false,
        "region": "ap-south-1",
        "title": "S3: Number of Objects"
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 7,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [ "AWS/CloudFront", "RequestCount", "DistributionId", "${aws_cloudfront_distribution.my_cloudfront_distribution.id}" ]
        ],
        "view": "timeSeries",
        "stacked": false,
        "region": "ap-south-1",
        "title": "CloudFront: Request Count"
      }
    },
    {
      "type": "metric",
      "x": 13,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [ "AWS/CloudFront", "4XXErrorRate", "DistributionId", "${aws_cloudfront_distribution.my_cloudfront_distribution.id}" ],
          [ ".", "5XXErrorRate", ".", "." ]
        ],
        "view": "timeSeries",
        "stacked": false,
        "region": "ap-south-1",
        "title": "CloudFront: Error Rates"
      }
    }
  ]
}
EOF
}