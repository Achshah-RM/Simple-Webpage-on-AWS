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
  access_key = <access_key> # AWS access key
  secret_key = <secret_key> # AWS secret key
}
