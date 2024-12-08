provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    # configurations of the s3 bucket are define at init runtime
  }
}
