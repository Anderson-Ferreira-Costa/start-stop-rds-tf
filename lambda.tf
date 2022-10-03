#start-rds
data "archive_file" "start" {
  type        = "zip"
  source_file = "start-rds.py"
  output_path = "start-rds.zip"
}
resource "aws_lambda_function" "start" {

  function_name    = "start-rds"
  filename         = data.archive_file.start.output_path
  source_code_hash = data.archive_file.start.output_base64sha256

  role    = aws_iam_role.role_for_lambda.arn
  runtime = "python3.7"
  handler = "start-rds.lambda_handler"
  timeout = 10
}

#stop-rds
data "archive_file" "stop" {
  type        = "zip"
  source_file = "stop-rds.py"
  output_path = "stop-rds.zip"
}
resource "aws_lambda_function" "stop" {

  function_name    = "stop-rds"
  filename         = data.archive_file.stop.output_path
  source_code_hash = data.archive_file.stop.output_base64sha256

  role    = aws_iam_role.role_for_lambda.arn
  runtime = "python3.7"
  handler = "stop-rds.lambda_handler"
  timeout = 10
}
