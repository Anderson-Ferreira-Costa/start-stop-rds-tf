region = "ca-central-1"

schedule_expression_start = "cron(00 9 ? * mon-fri *)"
schedule_expression_stop  = "cron(00 23 ? * mon-fri *)"

# Cluster RDS
# start = "start-cluster-rds"
# stop  = "stop-cluster-rds"

# RDS
start = "start-rds"
stop = "stop-rds"

# Adicionar tag no RDS
# autostart = yes
# autostop  = yes