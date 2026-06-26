terraform {
  backend "s3" {
    bucket         = "yashodhan-tf-state-bucket"
    key            = "app/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "yashodhan-tf-lock-table"
    encrypt        = true
  }
}
