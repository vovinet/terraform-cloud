terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  
  data "terraform_remote_state" "vpc" {
  backend = "remote"

    config = {
      organization = "vovinet-netology"
      workspaces = {
        name = "terraform-cloud"
        name = "prod"
      }
    }
  }

  backend "s3" {
    bucket = "vovinet-netology-states"
    key    = "terraform.tfstate"
    encrypt = true
    region = "eu-central-1"
  }
}
