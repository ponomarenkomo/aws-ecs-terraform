data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name           = "aws-ecs-vpc"
  cidr           = var.ecs_cidr
  azs            = data.aws_availability_zones.available.names
  public_subnets = var.ecs_public_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true
}

