# Define the required providers and their versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # specify the source for AWS provider
      version = "~> 3.0" # specify version constraints for AWS provider
    }
  }
}

provider "aws" {
  region     = "ap-south-1" # AWS region to deploy resources in
  access_key = "AKIAV4YZDKPT5RHCKGRT" # AWS access key
  secret_key = "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" # AWS secret key
}
