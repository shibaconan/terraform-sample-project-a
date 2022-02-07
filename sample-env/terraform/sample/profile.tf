# set aws profile
provider "aws" {
  region  = "ap-northeast-1"
  profile = "sample"
}

# set aws s3 bucket for terraform.tfstate
terraform {
  backend "s3" {
    bucket  = "sample-terraform-bucket"
    key     = "sample/sample/terraform.tfstate"
    acl     = "bucket-owner-full-control"
    region  = "ap-northeast-1"
    profile = "sample-terraform"
  }
}

data "terraform_remote_state" "common" {
  backend = "s3"

  config = {
    bucket  = "sample-terraform-bucket"
    key     = "sample/common/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "sample-terraform"
  }
}

