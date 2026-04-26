################################
# Secrets Manager — Dev Environment
################################
resource "aws_secretsmanager_secret" "dev" {
  name        = "${var.project}/dev/backend"
  description = "CHON backend secrets for dev environment"

  tags = {
    Name        = "${var.project}-dev-secrets"
    Environment = "dev"
  }
}

resource "aws_secretsmanager_secret_version" "dev" {
  secret_id = aws_secretsmanager_secret.dev.id
  secret_string = jsonencode({
    # Database
    DB_URL      = "jdbc:mariadb://${aws_db_instance.main.address}:3306/chon_dev"
    DB_USERNAME = "chon_dev_app"
    DB_PASSWORD = "ChonDev2026AppX7"

    # Authentication
    JWT_SECRET      = var.jwt_secret
    RSA_PUBLIC_KEY  = var.rsa_public_key
    RSA_PRIVATE_KEY = var.rsa_private_key
    ENCRYPT_KEY     = var.encrypt_key

    # Mail (placeholder — update with company mail credentials)
    MAIL_USER     = ""
    MAIL_PASSWORD = ""

    # URLs (will update when domain is purchased)
    BASE_URL_VIEW_IMAGE     = "http://${aws_lb.main.dns_name}/mcrs-api/public/image"
    BASE_URL_SHARE_LINK     = "http://${aws_lb.main.dns_name}/mcrs-api/share/verify-link"
    BASE_URL_SHARE_LINK_EVENT = "http://${aws_lb.main.dns_name}/mcrs-api/event/event-link"

    # DID (placeholder — get from vendor)
    ISSUER_DID_BASE_URL = ""
    ISSUER_DID_TOKEN    = ""
    ISSUER_DID_ID       = ""

    # App
    APP_KEY    = "chonselfid"
    URL_ORIGIN = "*"
  })
}

################################
# Secrets Manager — Staging Environment
################################
resource "aws_secretsmanager_secret" "stg" {
  name        = "${var.project}/stg/backend"
  description = "CHON backend secrets for staging environment"

  tags = {
    Name        = "${var.project}-stg-secrets"
    Environment = "stg"
  }
}

resource "aws_secretsmanager_secret_version" "stg" {
  secret_id = aws_secretsmanager_secret.stg.id
  secret_string = jsonencode({
    # Database
    DB_URL      = "jdbc:mariadb://${aws_db_instance.main.address}:3306/chon_stg"
    DB_USERNAME = "chon_stg_app"
    DB_PASSWORD = "ChonStg2026AppX7"

    # Authentication
    JWT_SECRET      = var.jwt_secret
    RSA_PUBLIC_KEY  = var.rsa_public_key
    RSA_PRIVATE_KEY = var.rsa_private_key
    ENCRYPT_KEY     = var.encrypt_key

    # Mail
    MAIL_USER     = ""
    MAIL_PASSWORD = ""

    # URLs
    BASE_URL_VIEW_IMAGE     = "http://${aws_lb.main.dns_name}/mcrs-api/public/image"
    BASE_URL_SHARE_LINK     = "http://${aws_lb.main.dns_name}/mcrs-api/share/verify-link"
    BASE_URL_SHARE_LINK_EVENT = "http://${aws_lb.main.dns_name}/mcrs-api/event/event-link"

    # DID
    ISSUER_DID_BASE_URL = ""
    ISSUER_DID_TOKEN    = ""
    ISSUER_DID_ID       = ""

    # App
    APP_KEY    = "chonselfid"
    URL_ORIGIN = "*"
  })
}

################################
# ECS Task Execution Role
# Allows ECS to pull images from ECR and read secrets
################################
resource "aws_iam_role" "ecs_task_execution" {
  name = "${var.project}-ecs-task-execution"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.project}-ecs-task-execution"
  }
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy" "ecs_secrets_access" {
  name = "${var.project}-ecs-secrets-access"
  role = aws_iam_role.ecs_task_execution.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue"
        ]
        Resource = [
          aws_secretsmanager_secret.dev.arn,
          aws_secretsmanager_secret.stg.arn,
          aws_secretsmanager_secret.vp_api_dev.arn
        ]
      }
    ]
  })
}

################################
# ECS Task Role (for app-level AWS access, e.g. S3)
################################
resource "aws_iam_role" "ecs_task" {
  name = "${var.project}-ecs-task"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.project}-ecs-task"
  }
}
