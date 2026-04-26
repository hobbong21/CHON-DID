output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "alb_security_group_id" {
  description = "ALB security group ID"
  value       = aws_security_group.alb.id
}

output "ecs_security_group_id" {
  description = "ECS security group ID"
  value       = aws_security_group.ecs.id
}

output "rds_security_group_id" {
  description = "RDS security group ID"
  value       = aws_security_group.rds.id
}

output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.backend.repository_url
}

output "github_actions_role_arn" {
  description = "IAM role ARN for GitHub Actions"
  value       = aws_iam_role.github_actions.arn
}

output "rds_endpoint" {
  description = "RDS endpoint (host:port)"
  value       = aws_db_instance.main.endpoint
}

output "rds_address" {
  description = "RDS hostname"
  value       = aws_db_instance.main.address
}

output "alb_dns_name" {
  description = "ALB DNS name (use this to access the backend)"
  value       = aws_lb.main.dns_name
}

output "alb_target_group_arn" {
  description = "Backend target group ARN (needed for ECS service)"
  value       = aws_lb_target_group.backend.arn
}

output "ecs_task_execution_role_arn" {
  description = "ECS task execution role ARN"
  value       = aws_iam_role.ecs_task_execution.arn
}

output "ecs_task_role_arn" {
  description = "ECS task role ARN"
  value       = aws_iam_role.ecs_task.arn
}

output "secrets_dev_arn" {
  description = "Dev secrets ARN"
  value       = aws_secretsmanager_secret.dev.arn
}

output "secrets_stg_arn" {
  description = "Stg secrets ARN"
  value       = aws_secretsmanager_secret.stg.arn
}

output "sns_alerts_arn" {
  description = "SNS topic ARN for alerts"
  value       = aws_sns_topic.alerts.arn
}

output "vp_api_ecr_repository_url" {
  description = "VP API ECR repository URL"
  value       = aws_ecr_repository.vp_api.repository_url
}

output "vp_api_target_group_arn" {
  description = "VP API target group ARN"
  value       = aws_lb_target_group.vp_api.arn
}

output "vp_api_secrets_dev_arn" {
  description = "VP API dev secrets ARN"
  value       = aws_secretsmanager_secret.vp_api_dev.arn
}

output "dashboard_url" {
  description = "CloudWatch dashboard URL"
  value       = "https://${var.aws_region}.console.aws.amazon.com/cloudwatch/home?region=${var.aws_region}#dashboards:name=${aws_cloudwatch_dashboard.dev.dashboard_name}"
}
