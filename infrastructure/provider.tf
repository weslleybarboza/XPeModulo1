provider "aws" {
  region = var.region
}

#centralizar o arquivo de controle de estado do terraform. Nao se pode usar variaveis no backend.
#o backend nao da para automatizar, precisamos criar o buket manualmente. Precisa existir antes de executar o tf.
terraform {
  backend "s3" {
    bucket = "datalake-weslley-production-156814630337-terraform-state"
    key    = "state/terraform.tfstate"
    region = "us-east-2"
  }
}