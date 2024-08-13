terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }

  backend "s3" {
    bucket = "statebackendbackup"
    region = "ap-south-1"
    # key = "state/ecs-ecr-s3.tfstate" 
  }
}

provider "aws" {
  region = "ap-south-1"

}
