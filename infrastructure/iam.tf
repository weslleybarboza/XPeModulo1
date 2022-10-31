#criando uma role para o lambda

#essa funcao tera a permissao de assumir uma role do servico lambda da AWS
resource "aws_iam_role" "lambda" {
  name               = "WESLLEYLambdaRole"
  assume_role_policy = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole"
            "Principal":{
                "Service":"lambda.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid":"AssumeRole"
        }
    ]
}
EOT

  tags = {
    cliente = "weslley"
  }

}

resource "aws_iam_policy" "lambda" {
  name        = "WESLLEYAWSLambdaBasicExecutionRolePolicy"
  path        = "/"
  description = "Provides write permissions to CloudWatch Logs, S3 buckets and EMR Steps"
  policy      = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "elasticmapreduce:*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "iam:PassRole",
            "Resource": ["arn:aws:iam:127012818163/EMR_DefaultRole",
                         "arn:aws:iam:127012818163/EMR_EC2_DefaultRole"]
        }        
    ]
}
EOT
}

#vinculando uma policy a uma role
resource "aws_iam_role_policy_attachment" "lambda_attach" {
  role       = aws_iam_role.lambda.name
  policy_arn = aws_iam_policy.lambda.arn
}
#role: possui atributo name 
#policy: possui atributo ern