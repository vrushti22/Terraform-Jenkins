resource "aws_s3_bucket" "my_app_bucket" {
  bucket = "my-terraform-bucket-2026"

  tags = {
    Name        = "Bucket of Vrushti"
    Environment = "Dev"
  }
}
