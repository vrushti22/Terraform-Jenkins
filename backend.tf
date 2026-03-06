terraform {
  backend "s3" {
    bucket = "terraform-state-project-vpc"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
