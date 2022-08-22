# Cloudtrail Trail

This module creates a standard management events cloudtrail trail, and the necessary permissions to enable it.

https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html

## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider_aws) (4.27.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_cloudtrail.management-trail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) (resource)
- [aws_s3_bucket.management-bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) (resource)
- [aws_s3_bucket_acl.management-bucket-acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) (resource)
- [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) (data source)
- [aws_canonical_user_id.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/canonical_user_id) (data source)
- [aws_iam_policy_document.cloudtrail_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

No optional inputs.

## Outputs

No outputs.
