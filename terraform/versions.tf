terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "807291694811-deployment-bucket-prod"
    key    = "state-file/git-hub/ec2-instance/terraform.tfstate"
    region = "eu-central-1"

    # Recommended for modern Terraform (v1.10+)
    # use_lockfile = true

    # Required for older versions (legacy)
    # dynamodb_table = "terraform-state-locks"

    encrypt = true
  }
}

provider "aws" {
  default_tags {
    tags = {
      app_name    = var.app_name
      environment = var.environment
      managed_by  = "Terraform"
    }
  }
}
