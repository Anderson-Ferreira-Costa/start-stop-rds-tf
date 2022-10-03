source_file = "stop-rds.py"

output_path = "stop-rds.zip"

name = "stop-rds"

description = "Pausa o RDS segunda a sexta"

schedule_expression = "cron(50 15 ? * mon-fri *)"

handler = "stop-rds.lambda_handler"