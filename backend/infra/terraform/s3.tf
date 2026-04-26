################################
# S3 Bucket — Dev Images
################################
resource "aws_s3_bucket" "images_dev" {
  bucket = "${var.project}-images-dev"

  tags = {
    Name        = "${var.project}-images-dev"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "images_dev" {
  bucket = aws_s3_bucket.images_dev.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "images_dev" {
  bucket                  = aws_s3_bucket.images_dev.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

################################
# S3 Bucket — Staging Images
################################
resource "aws_s3_bucket" "images_stg" {
  bucket = "${var.project}-images-stg"

  tags = {
    Name        = "${var.project}-images-stg"
    Environment = "stg"
  }
}

resource "aws_s3_bucket_versioning" "images_stg" {
  bucket = aws_s3_bucket.images_stg.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "images_stg" {
  bucket                  = aws_s3_bucket.images_stg.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

################################
# Grant ECS task role access to S3 buckets
################################
resource "aws_iam_role_policy" "ecs_s3_access" {
  name = "${var.project}-ecs-s3-access"
  role = aws_iam_role.ecs_task.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.images_dev.arn,
          "${aws_s3_bucket.images_dev.arn}/*",
          aws_s3_bucket.images_stg.arn,
          "${aws_s3_bucket.images_stg.arn}/*"
        ]
      }
    ]
  })
}
