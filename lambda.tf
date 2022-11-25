#start-rds
data "archive_file" "start" {
  type        = "zip"
  source_file = "${var.start}.py"
  output_path = "${var.start}.zip"
}
resource "aws_lambda_function" "start" {

  function_name    = "start-rds"
  filename         = data.archive_file.start.output_path
  source_code_hash = data.archive_file.start.output_base64sha256

  role    = aws_iam_role.role_for_lambda.arn
  runtime = "python3.7"
  handler = "${var.start}.lambda_handler"
  timeout = 10
}

#stop-rds
data "archive_file" "stop" {
  type        = "zip"
  source_file = "${var.stop}.py"
  output_path = "${var.stop}.zip"
}
resource "aws_lambda_function" "stop" {

  function_name    = "stop-rds"
  filename         = data.archive_file.stop.output_path
  source_code_hash = data.archive_file.stop.output_base64sha256

  role    = aws_iam_role.role_for_lambda.arn
  runtime = "python3.7"
  handler = "${var.stop}.lambda_handler"
  timeout = 10
}
