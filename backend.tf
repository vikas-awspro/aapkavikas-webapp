terraform {
  backend "s3" {
    bucket = "aapkavikas-cts111"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
