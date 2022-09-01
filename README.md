# Cloudtrail Trail

This module creates a standard management events cloudtrail trail, and the necessary permissions to enable it.

https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html

## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider_aws) (4.27.0)

- <a name="provider_random"></a> [random](#provider_random)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_cloudtrail.management-trail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) (resource)
- [aws_s3_bucket.management-bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) (resource)
- [aws_s3_bucket_acl.management-bucket-acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) (resource)
- [aws_s3_bucket_policy.management-bucket-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) (resource)
- [random_id.id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) (resource)
- [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) (data source)
- [aws_canonical_user_id.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/canonical_user_id) (data source)
- [aws_iam_policy_document.cloudtrail_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_namespace"></a> [namespace](#input_namespace)

Description: Define the namespace here, example: dev, uat, prod

Type: `string`

Default: `"dev"`

### <a name="input_region"></a> [region](#input_region)

Description: Define the region you'd wish the cloudtrail resources to be created in, example: us-west-2

Type: `string`

Default: `"us-west-2"`

## Outputs

No outputs.
