################################
# ECS Cluster
################################
resource "aws_ecs_cluster" "main" {
  name = "${var.project}-cluster"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  tags = {
    Name = "${var.project}-cluster"
  }
}

################################
# CloudWatch Log Group
################################
resource "aws_cloudwatch_log_group" "backend" {
  name              = "/ecs/${var.project}-dev"
  retention_in_days = 30

  tags = {
    Name        = "${var.project}-dev-logs"
    Environment = "dev"
  }
}

################################
# ECS Task Definition
################################
resource "aws_ecs_task_definition" "backend" {
  family                   = "${var.project}-backend-dev"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn
  task_role_arn            = aws_iam_role.ecs_task.arn

  container_definitions = jsonencode([
    {
      name      = "${var.project}-backend"
      image     = "${aws_ecr_repository.backend.repository_url}:latest"
      essential = true

      portMappings = [
        {
          containerPort = var.container_port
          protocol      = "tcp"
        }
      ]

      environment = [
        { name = "SPRING_PROFILES_ACTIVE", value = "dev" },
        { name = "ROOT_FOLDER_IMAGE", value = "/data/chon-images" },
        { name = "LOG_FILE_PATH", value = "/app/logs/chon-logs.log" },
      ]

      secrets = [
        { name = "DB_URL", valueFrom = "${aws_secretsmanager_secret.dev.arn}:DB_URL::" },
        { name = "DB_USERNAME", valueFrom = "${aws_secretsmanager_secret.dev.arn}:DB_USERNAME::" },
        { name = "DB_PASSWORD", valueFrom = "${aws_secretsmanager_secret.dev.arn}:DB_PASSWORD::" },
        { name = "JWT_SECRET", valueFrom = "${aws_secretsmanager_secret.dev.arn}:JWT_SECRET::" },
        { name = "RSA_PUBLIC_KEY", valueFrom = "${aws_secretsmanager_secret.dev.arn}:RSA_PUBLIC_KEY::" },
        { name = "RSA_PRIVATE_KEY", valueFrom = "${aws_secretsmanager_secret.dev.arn}:RSA_PRIVATE_KEY::" },
        { name = "ENCRYPT_KEY", valueFrom = "${aws_secretsmanager_secret.dev.arn}:ENCRYPT_KEY::" },
        { name = "MAIL_USER", valueFrom = "${aws_secretsmanager_secret.dev.arn}:MAIL_USER::" },
        { name = "MAIL_PASSWORD", valueFrom = "${aws_secretsmanager_secret.dev.arn}:MAIL_PASSWORD::" },
        { name = "BASE_URL_VIEW_IMAGE", valueFrom = "${aws_secretsmanager_secret.dev.arn}:BASE_URL_VIEW_IMAGE::" },
        { name = "BASE_URL_SHARE_LINK", valueFrom = "${aws_secretsmanager_secret.dev.arn}:BASE_URL_SHARE_LINK::" },
        { name = "BASE_URL_SHARE_LINK_EVENT", valueFrom = "${aws_secretsmanager_secret.dev.arn}:BASE_URL_SHARE_LINK_EVENT::" },
        { name = "APP_KEY", valueFrom = "${aws_secretsmanager_secret.dev.arn}:APP_KEY::" },
        { name = "URL_ORIGIN", valueFrom = "${aws_secretsmanager_secret.dev.arn}:URL_ORIGIN::" },
        { name = "ISSUER_DID_BASE_URL", valueFrom = "${aws_secretsmanager_secret.dev.arn}:ISSUER_DID_BASE_URL::" },
        { name = "ISSUER_DID_TOKEN", valueFrom = "${aws_secretsmanager_secret.dev.arn}:ISSUER_DID_TOKEN::" },
        { name = "ISSUER_DID_ID", valueFrom = "${aws_secretsmanager_secret.dev.arn}:ISSUER_DID_ID::" },
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.backend.name
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = "backend"
        }
      }

    }
  ])

  tags = {
    Name = "${var.project}-backend-dev"
  }
}

################################
# ECS Service
################################
resource "aws_ecs_service" "backend" {
  name            = "${var.project}-dev-svc"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.backend.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = aws_subnet.public[*].id
    security_groups  = [aws_security_group.ecs.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.backend.arn
    container_name   = "${var.project}-backend"
    container_port   = var.container_port
  }

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100

  health_check_grace_period_seconds = 180

  depends_on = [aws_lb_listener.http]

  tags = {
    Name = "${var.project}-dev-svc"
  }
}
