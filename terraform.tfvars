region = "ca-central-1"

schedule_expression_start = "cron(00 9 ? * mon-fri *)"
schedule_expression_stop  = "cron(00 1 ? * mon-sat *)"

start = "start-cluster"
stop  = "stop-cluster"

#start = "start-rds"
#stop = "stop-rds"