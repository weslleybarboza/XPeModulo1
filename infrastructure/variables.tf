variable "base_bucket_name" {
  default = "datalake-weslley"
}

variable "environment" {
  default = "production"
}

variable "account_number" {
  default = "156814630337"
}

variable "region" {
  default = "us-east-2"
}

variable "lambda_funcion_name" {
  default = "WESLLEYexecutaEMR"
}

variable "customer" {
  default = "weslley"
}

#criado no EC2/Key pairs
variable "key_pair_name" {
  default = "weslley-datalake"
}

variable "airflow_subnet_id" {
  default = "subnet-02c28755679c4792d"
}

variable "vpc_id" {
  default = "vpc-088067e91f4995420"
}