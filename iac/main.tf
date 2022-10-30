# HCL - Hashicorp configuration language
# Linguagem declarativa para gerenc de configuracao

resource "aws_s3_bucket" "datalake" {
  #parametros de config do recurso escolhido
  bucket = "${var.base_bucket_name}-${var.environment}-${var.account_number}"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    cliente = "weslley"
  }
}

# o cod abaixo serve para buscar um arq local e subir para o s3 - apenas arq pequenos
resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id #ref o recurso acima id = nome. aqui digo onde o arq sera depositado. cria dependencia
  key    = "emr-code/pyspark/job_spark_from_tr.py"
  acl    = "private"
  source = "../job_spark.py" #voltando uma pasta e selecionando arquivo
  etag   = filemd5("../job_spark.py")

}

provider "aws" {
  region = var.region
}