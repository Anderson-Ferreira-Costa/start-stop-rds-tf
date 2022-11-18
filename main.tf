#terraform {
#  backend "s3" {
#    bucket = ""
#    key    = ""
#    region = var.region
#  }
#}

provider "aws" {
  region = var.region
  profile = "anderson"
}