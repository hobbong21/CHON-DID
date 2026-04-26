# CHON Backend

Spring Boot backend for the CHON DID family tree application.

## Stack

- Java 21
- Spring Boot 3.2.5
- Maven
- MariaDB
- Spring Data JPA / Hibernate
- Spring Security + OAuth2 Resource Server
- Springdoc / Swagger UI
- Spring Boot Actuator

## Infrastructure

| Resource | Dev |
|----------|-----|
| Compute | ECS Fargate (256 CPU / 512 MB) |
| Database | RDS MariaDB 10.11 (db.t4g.micro) |
| Load Balancer | ALB (HTTP, HTTPS when domain is ready) |
| Image Storage | S3 (`chon-images-dev`) |
| Secrets | AWS Secrets Manager (`chon/dev/backend`) |
| Container Registry | ECR (`chon-backend`) |
| Monitoring | CloudWatch (alarms + dashboard) |
| Region | ap-northeast-2 (Seoul) |

All infrastructure is defined in Terraform: [`infra/terraform/`](./infra/terraform/)

Architecture decisions: [`docs/ADR-001-aws-infrastructure.md`](./docs/ADR-001-aws-infrastructure.md)

## CI/CD

GitHub Actions pipeline (`.github/workflows/backend-ci.yml`):

```
Push to main or dev → Compile & Test → Docker Build → Push to ECR
                                                          ↓
                                              (main only) Deploy to ECS
```

- **Push to `dev`**: CI only (compile, test, Docker build)
- **Push to `main`**: CI + auto-deploy to dev ECS environment
- **Pull requests**: CI only
- Authentication: OIDC (keyless, no AWS access keys)

## Live URLs (Dev)

- Health: `http://chon-alb-1022894078.ap-northeast-2.elb.amazonaws.com/mcrs-api/actuator/health`
- Swagger: `http://chon-alb-1022894078.ap-northeast-2.elb.amazonaws.com/mcrs-api/swagger-ui/index.html`
- Dashboard: [CloudWatch Dashboard](https://ap-northeast-2.console.aws.amazon.com/cloudwatch/home?region=ap-northeast-2#dashboards:name=chon-dev)

## Branch Strategy

| Branch | Purpose |
|--------|---------|
| `main` | Production-ready code. Auto-deploys to ECS. Do NOT push directly. |
| `dev` | Daily development. CI runs but no deploy. |
| `vendor/final-delivery` | Vendor pushes handover code here. |

Workflow: `dev` → PR → `main` → auto-deploy

## Run Locally

### Prerequisites

- Java 21
- Maven 3.9+
- MariaDB (local or remote)

### Local configuration

```bash
cp src/main/resources/application-local.properties.example src/main/resources/application-local.properties
```

Fill in your local database credentials and required values, then:

```bash
SPRING_PROFILES_ACTIVE=local mvn spring-boot:run
```

- Base URL: `http://localhost:8888/mcrs-api`
- Swagger UI: `http://localhost:8888/mcrs-api/swagger-ui/index.html`

### Run from IntelliJ IDEA

1. Open the project, ensure SDK is Java 21
2. Create `application-local.properties` from the example
3. Run `McrsApiApplication.java` with profile `local`

## Docker

Build and run locally:

```bash
docker build -t chon-backend .
docker run -p 8888:8888 \
  -e SPRING_PROFILES_ACTIVE=dev \
  -e DB_URL=jdbc:mariadb://host.docker.internal:3306/chondb \
  -e DB_USERNAME=root \
  -e DB_PASSWORD=yourpass \
  chon-backend
```

## Profiles

| Profile | Use |
|---------|-----|
| `local` | Local development with local DB |
| `dev` | Shared dev environment (ECS) |
| `live` | Production settings |

## Configuration and Secrets

All secrets are managed through:

- `application-local.properties` — local development (gitignored)
- Environment variables — Docker / ECS
- AWS Secrets Manager — cloud deployment (injected at container startup)

Never commit: database credentials, RSA keys, mail credentials, DID tokens, encryption keys.

## Main Functional Areas

- Identifier / card certificate management
- Clan / family certificate management
- Relation / family tree management
- Verify / verification and signature flows
- Event / event management and attendance
- Public file serving for uploaded images

## External Dependencies

- MariaDB (RDS in AWS)
- S3 for image storage (replaces local filesystem)
- SMTP service (Yandex)
- DID issuer service
