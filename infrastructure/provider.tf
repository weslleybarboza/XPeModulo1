provider "aws" {
  region = var.region
}

#centralizar o arquivo de controle de estado do terraform
terraform{
  backend "s3" {
    bucket = "datalake-weslley-production-156814630337-terraform-state"
    key = "state/terraform.tfstate"
    region = "us-east-2"
  }
}