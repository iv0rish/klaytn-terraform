provider "aws" {
  region = "ap-northeast-2"
}

locals {
  name = "service-chain-test"
  tags = {
    Terraform   = "true"
    Environment = "service-chain-vpc"
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name               = local.name
  cidr               = "10.0.0.0/16"
  azs                = ["ap-northeast-2a", "ap-northeast-2c"]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway = true
  tags               = local.tags
}
