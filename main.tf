provider "aws" {
  region = var.region
}

#Create CloudTrail trail
resource "aws_cloudtrail" "management-trail" {
  name                          = "management-trail"
  s3_bucket_name                = aws_s3_bucket.management-bucket.id
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  enable_logging                = true
  depends_on = [
    data.aws_iam_policy_document.cloudtrail_s3_policy,
    aws_s3_bucket_acl.management-bucket-acl
  ]
}

#Create User id objects for CloudTrail
data "aws_caller_identity" "current" {}
data "aws_canonical_user_id" "current" {}

#Create CloudTrail bucket
resource "aws_s3_bucket" "management-bucket" {
  bucket        = "trails-management-bucket-${var.namespace}"
  force_destroy = true
  depends_on = [
    random_id.id
  ]
}

resource "aws_s3_bucket_policy" "management-bucket-policy" {
  bucket = aws_s3_bucket.management-bucket.id
  policy = data.aws_iam_policy_document.cloudtrail_s3_policy.json
}

#Create bucket ACL
resource "aws_s3_bucket_acl" "management-bucket-acl" {
  bucket = aws_s3_bucket.management-bucket.id
  access_control_policy {
    grant {
      grantee {
        id   = data.aws_canonical_user_id.current.id
        type = "CanonicalUser"
      }
      permission = "FULL_CONTROL"
    }
    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }
}

#Create CloudTrail iam policy document

data "aws_iam_policy_document" "cloudtrail_s3_policy" {
  statement {
    sid    = "AWSCloudTrailAclCheck"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    actions   = ["s3:GetBucketAcl"]
    resources = [aws_s3_bucket.management-bucket.arn]
  }

  statement {
    sid    = "AWSCloudTrailWrite"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.management-bucket.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"]
    condition {
      test     = "StringEquals"
      values   = ["bucket-owner-full-control"]
      variable = "s3:x-amz-acl"
    }
  }
}
