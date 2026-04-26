################################
# VP API — ECR Repository
################################
resource "aws_ecr_repository" "vp_api" {
  name                 = "${var.project}-vp-api"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.project}-vp-api"
  }
}

resource "aws_ecr_lifecycle_policy" "vp_api" {
  repository = aws_ecr_repository.vp_api.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 10 images"
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 10
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}

################################
# VP API — CloudWatch Log Group
################################
resource "aws_cloudwatch_log_group" "vp_api" {
  name              = "/ecs/${var.project}-vp-api"
  retention_in_days = 30

  tags = {
    Name        = "${var.project}-vp-api-logs"
    Environment = "dev"
  }
}

################################
# VP API — Secrets Manager
################################
resource "aws_secretsmanager_secret" "vp_api_dev" {
  name        = "${var.project}/dev/vp-api"
  description = "CHON VP API secrets for dev environment"

  tags = {
    Name        = "${var.project}-vp-api-dev-secrets"
    Environment = "dev"
  }
}

resource "aws_secretsmanager_secret_version" "vp_api_dev" {
  secret_id = aws_secretsmanager_secret.vp_api_dev.id
  secret_string = jsonencode({
    JWT_SECRET               = var.jwt_secret
    FIREBASE_SERVICE_ACCOUNT = ""
    DB_HOST                  = aws_db_instance.main.address
    DB_PORT                  = "3306"
    DB_USERNAME              = "chon_dev_app"
    DB_PASSWORD              = "ChonDev2026AppX7"
    DB_NAME                  = "chon_dev"
  })
}

################################
# VP API — Target Group
################################
resource "aws_lb_target_group" "vp_api" {
  name        = "${var.project}-vp-api-tg"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    enabled             = true
    path                = "/vp-api/v1/health"
    port                = "traffic-port"
    protocol            = "HTTP"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 10
    interval            = 30
    matcher             = "200"
  }

  tags = {
    Name = "${var.project}-vp-api-tg"
  }
}

################################
# VP API — ALB Listener Rule
# Path /vp-api/* → VP target group (priority 10, before default)
################################
resource "aws_lb_listener_rule" "vp_api" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.vp_api.arn
  }

  condition {
    path_pattern {
      values = ["/vp-api/*"]
    }
  }

  tags = {
    Name = "${var.project}-vp-api-rule"
  }
}

################################
# VP API — ECS Task Definition
################################
resource "aws_ecs_task_definition" "vp_api" {
  family                   = "${var.project}-vp-api-dev"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn
  task_role_arn            = aws_iam_role.ecs_task.arn

  container_definitions = jsonencode([
    {
      name      = "${var.project}-vp-api"
      image     = "${aws_ecr_repository.vp_api.repository_url}:latest"
      essential = true

      portMappings = [
        {
          containerPort = 3000
          protocol      = "tcp"
        }
      ]

      environment = [
        { name = "NODE_ENV", value = "production" },
        { name = "PORT", value = "3000" },
      ]

      secrets = [
        { name = "JWT_SECRET", valueFrom = "${aws_secretsmanager_secret.vp_api_dev.arn}:JWT_SECRET::" },
        { name = "FIREBASE_SERVICE_ACCOUNT", valueFrom = "${aws_secretsmanager_secret.vp_api_dev.arn}:FIREBASE_SERVICE_ACCOUNT::" },
        { name = "DB_HOST", valueFrom = "${aws_secretsmanager_secret.vp_api_dev.arn}:DB_HOST::" },
        { name = "DB_PORT", valueFrom = "${aws_secretsmanager_secret.vp_api_dev.arn}:DB_PORT::" },
        { name = "DB_USERNAME", valueFrom = "${aws_secretsmanager_secret.vp_api_dev.arn}:DB_USERNAME::" },
        { name = "DB_PASSWORD", valueFrom = "${aws_secretsmanager_secret.vp_api_dev.arn}:DB_PASSWORD::" },
        { name = "DB_NAME", valueFrom = "${aws_secretsmanager_secret.vp_api_dev.arn}:DB_NAME::" },
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.vp_api.name
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = "vp-api"
        }
      }
    }
  ])

  tags = {
    Name = "${var.project}-vp-api-dev"
  }
}

################################
# VP API — ECS Service
################################
resource "aws_ecs_service" "vp_api" {
  name            = "${var.project}-vp-api-svc"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.vp_api.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = aws_subnet.public[*].id
    security_groups  = [aws_security_group.ecs.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.vp_api.arn
    container_name   = "${var.project}-vp-api"
    container_port   = 3000
  }

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100

  health_check_grace_period_seconds = 120

  depends_on = [aws_lb_listener_rule.vp_api]

  tags = {
    Name = "${var.project}-vp-api-svc"
  }
}
