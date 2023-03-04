terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    github = {
      source  = "integrations/github"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


