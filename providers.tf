terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  # alias  = "east"
}

/* provider "aws" {
  region = "us-west-1"
  alias  = "west"
} */
