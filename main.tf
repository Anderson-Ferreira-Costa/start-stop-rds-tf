#####################################################################
#                               START RDS                           #
#####################################################################
resource "aws_lambda_function" "start" {

  function_name    = "start-rds"
  filename         = data.archive_file.start.output_path
  source_code_hash = data.archive_file.start.output_base64sha256

  role    = aws_iam_role.role_for_lambda.arn
  runtime = "python3.7"
  handler = "${var.start}.lambda_handler"
  timeout = 10
}

resource "aws_lambda_permission" "start" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.start.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.start.arn
}

resource "aws_cloudwatch_event_rule" "start" {
  name                = "start-rds"
  description         = "Inicia o RDS de segunda a sexta"
  schedule_expression = var.schedule_expression_start
}

resource "aws_cloudwatch_event_target" "start" {
  arn  = aws_lambda_function.start.arn
  rule = aws_cloudwatch_event_rule.start.name
}

#####################################################################
#                               STOP RDS                            #
#####################################################################
resource "aws_lambda_function" "stop" {

  function_name    = "stop-rds"
  filename         = data.archive_file.stop.output_path
  source_code_hash = data.archive_file.stop.output_base64sha256

  role    = aws_iam_role.role_for_lambda.arn
  runtime = "python3.7"
  handler = "${var.stop}.lambda_handler"
  timeout = 10
}

resource "aws_lambda_permission" "stop" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.stop.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.stop.arn
}

resource "aws_cloudwatch_event_rule" "stop" {
  name                = "stop-rds"
  description         = "Pausa o RDS de segunda a sexta"
  schedule_expression = var.schedule_expression_stop
}

resource "aws_cloudwatch_event_target" "stop" {
  arn  = aws_lambda_function.stop.arn
  rule = aws_cloudwatch_event_rule.stop.name
}

# Adicionar tag no RDS
# autostart = yes
# autostop  = yes