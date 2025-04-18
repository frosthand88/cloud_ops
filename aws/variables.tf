variable "enable_alb" {
  description = "Whether to create the ALB"
  type        = bool
  default     = false
}

variable "enable_eks" {
  description = "Whether to create the EKS"
  type        = bool
  default     = false
}

variable "enable_s3" {
  description = "Whether to create the S3"
  type        = bool
  default     = false
}

variable "enable_route53" {
  description = "Whether to create the S3"
  type        = bool
  default     = false
}

variable "coldhand_ip" {
  description = "IP address of coldhand_ip"
  type        = string
  default     = false
}
