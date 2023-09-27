data "archive_file" "start" {
  type        = "zip"
  source_file = "${local.start}.py"
  output_path = "${local.start}.zip"
}

data "archive_file" "stop" {
  type        = "zip"
  source_file = "${local.stop}.py"
  output_path = "${local.stop}.zip"
}