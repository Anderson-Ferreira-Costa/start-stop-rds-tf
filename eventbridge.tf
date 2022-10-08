#start-rds
resource "aws_cloudwatch_event_rule" "start" {
  name                = "start-rds"
  description         = "Inicia o RDS de segunda a sexta"
  schedule_expression = var.schedule_expression_start
}

resource "aws_cloudwatch_event_target" "start" {
  arn  = aws_lambda_function.start.arn
  rule = aws_cloudwatch_event_rule.start.name
}

resource "aws_lambda_permission" "start" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.start.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.start.arn
}

#stop-rds
resource "aws_cloudwatch_event_rule" "stop" {
  name                = "stop-rds"
  description         = "Pausa o RDS de segunda a sexta"
  schedule_expression = var.schedule_expression_stop
}

resource "aws_cloudwatch_event_target" "stop" {
  arn  = aws_lambda_function.stop.arn
  rule = aws_cloudwatch_event_rule.stop.name
}

resource "aws_lambda_permission" "stop" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.stop.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.stop.arn
}