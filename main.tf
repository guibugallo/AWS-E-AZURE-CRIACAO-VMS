terraform {
  required_version = ">= 1.5.0"


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.52.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.106.1"
    }
  }

  backend "s3" {
    bucket = "remote-state-gbugallo-bucket"
    key    = "pipeline-gitlab/terraform.tfstate"
    region = "sa-east-1"
  }

}


#### AWS ####
provider "aws" {
  # Configuration options
  region = "sa-east-1"

  default_tags {
    tags = {
      owner      = "guiBugallo"
      managed-by = "Terraform"
    }
  }
}


#### AZURE ####
provider "azurerm" {
  # Configuration options

  features {}
}


##### Backend AWS ####
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "remote-state-gbugallo-bucket"
    key    = "aws-vpc/terraform.tfstate"
    region = "sa-east-1"
  }
}

#### Backend AZURE ####
data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "gbugalloterraformstate"
    container_name       = "remote-state-gbugallo"
    key                  = "azure-vnet/terraform.tfstate"
  }
}