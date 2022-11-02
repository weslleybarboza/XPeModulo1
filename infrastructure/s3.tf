#bucket utilizado para armazenar os dados processados

resource "aws_s3_bucket" "datalake" {
  #parametros de config do recurso escolhido
  bucket = "${var.base_bucket_name}-${var.environment}-${var.account_number}-tf"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    cliente = var.customer
  }
}

#bucket utilizado para dados stream
resource "aws_s3_bucket" "stream" {
  #parametros de config do recurso escolhido
  bucket = "${var.base_bucket_name}-${var.environment}-${var.account_number}-stream-tf"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    cliente = var.customer
  }
}