data "archive_file" "start" {
  type        = "zip"
  source_file = "${var.start}.py"
  output_path = "${var.start}.zip"
}

data "archive_file" "stop" {
  type        = "zip"
  source_file = "${var.stop}.py"
  output_path = "${var.stop}.zip"
}