module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "eks-sandbox"
  cluster_version = "1.30"
  vpc_id          = module.vpc.vpc_id
  create_iam_oidc_provider = false
  subnet_ids      = module.vpc.private_subnets
  enable_irsa     = true

  eks_managed_node_groups = {
    nodes = {
      desired_size = 2
      min_size     = 1
      max_size     = 3
      instance_types = ["t3.medium"]
    }
  }

  tags = {
    Project = "EKS-Sandbox"
  }
}
