## Add the following tags to your RDS
#### Start Tag
```
autostart = yes
```

#### Stop Tag
```
autostop  = yes
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.4.0 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.18.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.start](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.stop](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.start](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.stop](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.role_for_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.start](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_function.stop](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.start](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lambda_permission.stop](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [archive_file.start](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [archive_file.stop](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.start-stop-rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | A AWS region where the resources will be managed. | `string` | n/a | yes |
| <a name="input_schedule_expression_start"></a> [schedule\_expression\_start](#input\_schedule\_expression\_start) | The cron or rate expression for starting the resource. | `string` | n/a | yes |
| <a name="input_schedule_expression_stop"></a> [schedule\_expression\_stop](#input\_schedule\_expression\_stop) | The cron or rate expression for stopping the resource. | `string` | n/a | yes |
| <a name="input_start"></a> [start](#input\_start) | The action to start the resource (e.g., 'start' lambda function). | `string` | n/a | yes |
| <a name="input_stop"></a> [stop](#input\_stop) | The action to stop the resource (e.g., 'stop' lambda function). | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_start_lambda_arn"></a> [start\_lambda\_arn](#output\_start\_lambda\_arn) | The ARN (Amazon Resource Name) of the Lambda function used to start the resource. |
| <a name="output_stop_lambda_arn"></a> [stop\_lambda\_arn](#output\_stop\_lambda\_arn) | The ARN (Amazon Resource Name) of the Lambda function used to stop the resource. |
