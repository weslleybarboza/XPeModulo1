resource "aws_cloudwatch_log_group" "firehose" {
  name              = "${var.customer}-kinesis-firehose-delivery-stream-log-group"
  retention_in_days = 1 #retencao de logs

  tags = {
    cliente = var.customer
  }
}


resource "aws_cloudwatch_log_stream" "firehose" {
  name           = "${var.customer}-kinesis-firehose-delivery-stream-log-stream"
  log_group_name = aws_cloudwatch_log_group.firehose.name
}