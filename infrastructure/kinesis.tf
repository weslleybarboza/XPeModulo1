# #knesis - ferramenta para entrega de dados - micro batchs

# resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
#   name        = "${var.customer}-kinesis-firehose-s3-stream"
#   destination = "extended_s3"

#   extended_s3_configuration {
#     role_arn        = aws_iam_role.firehose_role.arn
#     bucket_arn      = aws_s3_bucket.stream.arn
#     prefix          = "firehose/" #por padrao o kiness entrega os dados por dia mes ano, porem podemos add uma pasta para agrupar
#     buffer_size     = 5           #a cada 5mb faz entrega ou
#     buffer_interval = 60          #a cada 60 segundos

#     cloudwatch_logging_options {
#       enabled         = true
#       log_group_name  = aws_cloudwatch_log_group.firehose.name
#       log_stream_name = aws_cloudwatch_log_stream.firehose.name
#     }

#   }
#   tags = {
#     cliente = var.customer
#   }
# }

# resource "aws_iam_role" "firehose_role" {
#   name = "${var.customer}_firehose_role"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "firehose.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
# }