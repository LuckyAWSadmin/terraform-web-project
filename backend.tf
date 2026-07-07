terraform {
  backend "s3" {
    bucket = "terraform-web-project-tfstate-2026"
    key    = "terraform-web-project/terraform.tfstate"
    region = "ap-south-1"
  }
}