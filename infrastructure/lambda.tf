resource "aws_lambda_function" "executa_emr" {
  #para subir cod na function precisamos colocar tudo em um zip e subir.
  filename      = "lambda_function_payload.zip"
  function_name = var.lambda_funcion_name
  #role sendo criado no iam.tf
  role = aws_iam_role.lambda.arn
  #handler ref. a funcao do lambda_function.py
  handler = "lambda_function.handler"
  #memoria max
  memory_size = 128
  #tempo max de exec em segundos
  timeout = 30

  #controlar o zip - versao para nao subir se ja existir
  source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "python3.8"

  tags = {
    cliente = "weslley"
  }
}