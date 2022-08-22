# ECR Repository

This module generates an ECR repository from a name to be used to store docker images and push to ECS.

https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-create.html

https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/US_SetupSNS.html

## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider_aws)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_cloudwatch_metric_alarm.cpu-utilization-alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) (resource)
- [aws_cloudwatch_metric_alarm.task-count-alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) (resource)
- [aws_sns_topic_subscription.sns-subscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) (resource)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_alert_email"></a> [alert_email](#input_alert_email)

Description: Specify the email you'd like the alerts to go to

Type: `string`

Default: `"alerts@synapsestudios.com"`

### <a name="input_aws_region"></a> [aws_region](#input_aws_region)

Description: Specify what region to create resources in

Type: `string`

Default: `"us-west-2"`

### <a name="input_cluster_name"></a> [cluster_name](#input_cluster_name)

Description: Cluster name of ECS service to be alerted on (Example: puppies-production)

Type: `string`

Default: `"service-production"`

### <a name="input_cpu_utilization_threshold"></a> [cpu_utilization_threshold](#input_cpu_utilization_threshold)

Description: Desired CPU Utilization threshold that will be compared in alert (Example: 90 for 90% average over 60 seconds in ECS Service)

Type: `string`

Default: `"90"`

### <a name="input_desired_task_threshold"></a> [desired_task_threshold](#input_desired_task_threshold)

Description: Desired task threshold that will be compared in alert (Example: 1 for alerts below 1 running task in ECS Service)

Type: `string`

Default: `"1"`

### <a name="input_service_name"></a> [service_name](#input_service_name)

Description: Service name of ECS service to be alerted on (Example: puppies-api, puppies-job_queue)

Type: `string`

Default: `"appname-api"`

### <a name="input_sns_arn"></a> [sns_arn](#input_sns_arn)

Description: Full arn of the desired sns topic to subscribe alarm to (Example: arn:aws:sns:region-name:XXXX:cloudwatch-topic)

Type: `string`

Default: `"arn:aws:sns:region-name:XXXX:cloudwatch-topic"`

### <a name="input_use_sns"></a> [use_sns](#input_use_sns)

Description: Use SNS for notifications

Type: `bool`

Default: `true`

## Outputs

The following outputs are exported:

### <a name="output_cloudwatch_alarm_cpu_arn"></a> [cloudwatch_alarm_cpu_arn](#output_cloudwatch_alarm_cpu_arn)

Description: Output aws cloudwatch alarm for cpuUtilization arn

### <a name="output_cloudwatch_alarm_cpu_id"></a> [cloudwatch_alarm_cpu_id](#output_cloudwatch_alarm_cpu_id)

Description: Output aws cloudwatch alarm for cpuUtilization id

### <a name="output_cloudwatch_alarm_task_arn"></a> [cloudwatch_alarm_task_arn](#output_cloudwatch_alarm_task_arn)

Description: Output aws cloudwatch alarm for taskCount arn

### <a name="output_cloudwatch_alarm_task_id"></a> [cloudwatch_alarm_task_id](#output_cloudwatch_alarm_task_id)

Description: Output aws cloudwatch alarm for taskCount id
