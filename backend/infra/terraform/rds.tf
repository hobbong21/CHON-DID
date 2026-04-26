################################
# DB Subnet Group
################################
resource "aws_db_subnet_group" "main" {
  name       = "${var.project}-db-subnet"
  subnet_ids = aws_subnet.public[*].id

  tags = {
    Name = "${var.project}-db-subnet"
  }
}

################################
# RDS MariaDB Instance
# Single instance for dev + stg databases
# db.t4g.micro — ~$13/mo
################################
resource "aws_db_instance" "main" {
  identifier     = "${var.project}-db"
  engine         = "mariadb"
  engine_version = "10.11"
  instance_class = "db.t4g.micro"

  allocated_storage     = 20
  max_allocated_storage = 50
  storage_type          = "gp3"

  db_name  = "chon_dev"
  username = var.db_master_username
  password = var.db_master_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  publicly_accessible    = false

  multi_az            = false
  skip_final_snapshot = true

  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  maintenance_window      = "Mon:04:00-Mon:05:00"

  parameter_group_name = aws_db_parameter_group.main.name

  tags = {
    Name = "${var.project}-db"
  }
}

################################
# Parameter Group (UTF-8 support for Korean)
################################
resource "aws_db_parameter_group" "main" {
  name   = "${var.project}-mariadb-params"
  family = "mariadb10.11"

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }

  parameter {
    name  = "collation_server"
    value = "utf8mb4_unicode_ci"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8mb4"
  }

  tags = {
    Name = "${var.project}-mariadb-params"
  }
}
