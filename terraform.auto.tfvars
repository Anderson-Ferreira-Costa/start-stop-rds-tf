region = "ca-central-1"

schedule_expression_start = "cron(00 9 ? * mon-fri *)"
schedule_expression_stop  = "cron(00 1 ? * mon-sat *)"

start = "scripts/start-cluster"
stop  = "scripts/stop-cluster"