resource "aws_glue_catalog_database" "stream" {
  name = "${var.customer}-streamingdb"
}

resource "aws_glue_crawler" "stream" {
  database_name = aws_glue_catalog_database.stream.name
  name          = "${var.customer}-firehose_stream_s3_crawler"
  role          = aws_iam_role.glue_role.arn

  s3_target {
    path = "s3://${aws_s3_bucket.stream.bucket}/firehose/"
  }

  configuration = <<EOF
{
   "Version": 1.0,
   "Grouping": {
      "TableGroupingPolicy": "CombineCompatibleSchemas" }
}
EOF

  tags = {
    cliente = var.customer
  }
}