output "cluster_name" {
  value = var.enable_eks ? module.eks[0].cluster_name : null
}

output "cluster_endpoint" {
  value = var.enable_eks ? module.eks[0].cluster_endpoint : null
}

output "cluster_certificate_authority_data" {
  value = var.enable_eks ? module.eks[0].cluster_certificate_authority_data : null
}

output "cluster_id" {
  value = var.enable_eks ? module.eks[0].cluster_id : null
}

output "aws_access_key_id" {
  value = aws_iam_access_key.local_dev_user_key.id
}

output "aws_secret_access_key" {
  value     = aws_iam_access_key.local_dev_user_key.secret
  sensitive = true
}

