resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id #ref o recurso acima id = nome. aqui digo onde o arq sera depositado. cria dependencia
  key    = "emr-code/pyspark/job_spark_from_tr.py"
  acl    = "private"
  source = "../job_spark.py" #voltando uma pasta e selecionando arquivo
  etag   = filemd5("../job_spark.py")

}