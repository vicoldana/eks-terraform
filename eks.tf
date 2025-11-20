module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "eks-task3"
  cluster_version = "1.30"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  # 🔹 Dezactivează complet IRSA și partea de IAM
  enable_irsa = false

  # 🔹 Dezactivează toate add-on-urile care folosesc OIDC
  cluster_addons = {}

  eks_managed_node_groups = {
    nodes = {
      desired_size  = 2
      min_size      = 1
      max_size      = 3
      instance_types = ["t3.medium"]

      # 🔹 dezactivează crearea automată de roluri IAM pentru noduri
      create_iam_role = false
    }
  }

  tags = {
    Project = "EKS-Task3"
  }
}
