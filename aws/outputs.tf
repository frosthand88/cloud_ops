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

