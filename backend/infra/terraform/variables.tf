variable "aws_region" {
  description = "AWS region"
  default     = "ap-northeast-2"
}

variable "project" {
  description = "Project name"
  default     = "chon"
}

variable "environment" {
  description = "Environment (dev, stg, prod)"
  default     = "dev"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks (one per AZ)"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "Availability zones"
  default     = ["ap-northeast-2a", "ap-northeast-2c"]
}

variable "container_port" {
  description = "Backend container port"
  default     = 8888
}

variable "db_port" {
  description = "Database port"
  default     = 3306
}

variable "rsa_public_key" {
  description = "RSA public key for JWT"
  type        = string
  sensitive   = true
  default     = ""
}

variable "rsa_private_key" {
  description = "RSA private key for JWT"
  type        = string
  sensitive   = true
  default     = ""
}

variable "encrypt_key" {
  description = "Encryption key"
  type        = string
  sensitive   = true
  default     = ""
}

variable "jwt_secret" {
  description = "Shared JWT signing secret (HS256) — used by both Spring Boot and VP API"
  type        = string
  sensitive   = true
  default     = ""
}

variable "db_master_username" {
  description = "RDS master username"
  default     = "chon_admin"
  sensitive   = true
}

variable "db_master_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

variable "github_org" {
  description = "GitHub organization or username"
  default     = "CHONDID"
}

variable "github_repo" {
  description = "GitHub repository name"
  default     = "chon-backend"
}

variable "alert_email" {
  description = "Email address for CloudWatch alarm notifications"
  type        = string
  default     = ""
}
