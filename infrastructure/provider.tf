provider "aws" {
  region = var.region
}

#centralizar o arquivo de controle de estado do terraform
terraform{
  backend "s3" {
    bucket = "${var.base_bucket_name}-${var.environment}-${var.account_number}-terraform-state"
    key = "state/terraform.tfstate"
    region = var.region
  }
}