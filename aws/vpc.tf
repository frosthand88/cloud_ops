# Optional: VPC setup (use default for quick start)
module "vpc" {
  count   = var.enable_eks ? 1 : 0
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "eks-fargate-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-southeast-1a", "ap-southeast-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  enable_dns_hostnames = true
  enable_dns_support   = true
}

# 1. Create a VPC
resource "aws_vpc" "main" {
  count      = var.enable_alb ? 1 : 0
  cidr_block = "10.0.0.0/16"
}

# 2. Create a public subnet
resource "aws_subnet" "main" {
  count             = var.enable_alb ? 1 : 0
  vpc_id            = aws_vpc.main[0].id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}
