variable "region" {
  type        = string
  description = "A AWS region where the resources will be managed."
}

variable "schedule_expression_start" {
  type        = string
  description = "The cron or rate expression for starting the resource."
}

variable "schedule_expression_stop" {
  type        = string
  description = "The cron or rate expression for stopping the resource."
}

variable "start" {
  type        = string
  description = "The action to start the resource (e.g., 'start' lambda function)."
}

variable "stop" {
  type        = string
  description = "The action to stop the resource (e.g., 'stop' lambda function)."
}
