provider "aws" {
  region  = "us-east-1"
# profile = ""
}

variable "schedule_expression_start" {
  type    = string
  default = "cron(00 9 ? * mon-fri *)"
}

variable "schedule_expression_stop" {
  type    = string
  default = "cron(00 3 ? * mon-sat *)"
}
