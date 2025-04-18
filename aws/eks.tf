# EKS Cluster
module "eks" {
  count   = var.enable_eks ? 1 : 0
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "eks-fargate-demo"
  cluster_version = "1.29"
  subnet_ids      = module.vpc[0].private_subnets
  vpc_id          = module.vpc[0].vpc_id

  eks_managed_node_groups = {}

  fargate_profiles = {
    default = {
      selectors = [
        {
          namespace = "default"
        }
      ]
    }
  }

  enable_irsa = true
}

