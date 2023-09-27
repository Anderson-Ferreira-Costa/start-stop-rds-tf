output "start_lambda_arn" {
  value       = aws_lambda_function.start.arn
  description = "The ARN (Amazon Resource Name) of the Lambda function used to start the resource."
}

output "stop_lambda_arn" {
  value       = aws_lambda_function.stop.arn
  description = "The ARN (Amazon Resource Name) of the Lambda function used to stop the resource."
}
