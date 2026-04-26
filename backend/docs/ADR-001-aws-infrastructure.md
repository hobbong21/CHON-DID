# ADR-001: AWS Infrastructure for CHON Platform

**Date:** 2026-04-13
**Status:** Accepted
**Author:** Abdul Karim Moro

## Context

CHON is a DID-based identity/certificate management platform developed by an external vendor. The company is taking ownership of the codebase and infrastructure. The vendor's setup has critical issues:

- Shared database across all environments (dev/stg/prod using same DB)
- Root database credentials used by the application
- No environment isolation — a dev mistake can affect production
- Infrastructure hosted on vendor-controlled servers with no company access
- No CI/CD pipelines, manual deployments

The vendor will deliver final code updates on April 19, 2026. We need company-owned infrastructure ready before that date.

## Decision

### Cloud Provider: AWS (ap-northeast-2 / Seoul)
Chosen for proximity to primary users (South Korea) and team familiarity.

### Compute: ECS Fargate
- **Why not EC2:** No need to manage servers. Fargate is serverless and scales to zero when not in use.
- **Why not EKS:** Overkill for a single backend service. EKS has a $73/mo control plane cost.
- **Why not Lambda:** The Spring Boot app has a 145-second cold start. Lambda's 15-min max runtime and cold start penalty make it unsuitable.
- **Configuration:** 256 CPU / 512 MB memory (sufficient for dev, can scale up for prod).

### Database: RDS MariaDB (db.t4g.micro)
- Matches vendor's existing MariaDB setup — zero migration effort.
- Automated backups (7-day retention), encryption at rest.
- Separate database credentials per environment via Secrets Manager.

### Networking: VPC with Public Subnets
- 2 public subnets across 2 AZs (ap-northeast-2a, ap-northeast-2c) for ALB requirement.
- No private subnets or NAT Gateway for dev/stg — saves ~$32/mo per NAT.
- ECS tasks have public IPs but are locked down via security groups (only ALB can reach port 8888).
- Will add private subnets + NAT for production.

### Load Balancer: ALB (HTTP only for now)
- Health checks on `/mcrs-api/actuator/health`.
- HTTPS will be added when a domain is purchased (ACM certificate + Route 53).
- ALB DNS: `chon-alb-1022894078.ap-northeast-2.elb.amazonaws.com`

### Image Storage: S3
- Replaces local filesystem storage (`/data/chon-images`).
- Separate buckets per environment: `chon-images-dev`, `chon-images-stg`.
- Versioning enabled, public access blocked.

### Secrets: AWS Secrets Manager
- All sensitive config (DB creds, RSA keys, API keys) stored in Secrets Manager.
- Injected into ECS containers at runtime — never stored in code or Docker images.
- Separate secrets per environment: `chon/dev/backend`, `chon/stg/backend`.

### CI/CD: GitHub Actions with OIDC
- **Why OIDC:** No long-lived AWS access keys. GitHub assumes an IAM role via OpenID Connect.
- **Backend pipeline:** Compile → Docker Build → ECR Push → ECS Deploy (auto on push to main).
- **Mobile pipeline:** Analyze → Build Android APK + Build iOS (artifacts uploaded to GitHub).

### Infrastructure-as-Code: Terraform
- All AWS resources defined in `infra/terraform/`.
- State stored locally (will migrate to S3 backend for team collaboration).

## Estimated Monthly Cost (Dev + Stg)

| Service | Cost |
|---------|------|
| ECS Fargate (1 task, 256 CPU / 512 MB) | ~$9 |
| RDS db.t4g.micro (20 GB) | ~$15 |
| ALB | ~$16 |
| S3 (minimal storage) | ~$1 |
| Secrets Manager (16 secrets) | ~$6 |
| CloudWatch (6 alarms + 1 dashboard) | ~$4 |
| ECR (image storage) | ~$1 |
| **Total** | **~$52/mo** |

## Architecture Diagram

```
                    ┌─────────────────────────────────────┐
                    │           AWS (ap-northeast-2)       │
                    │                                      │
  Users ──────────► │  ALB (port 80)                       │
                    │    │                                  │
                    │    ▼                                  │
                    │  ECS Fargate                          │
                    │  ┌──────────────────┐                │
                    │  │ Spring Boot App  │                │
                    │  │ (chon-backend)   │───► RDS MariaDB│
                    │  │ Port 8888       │                │
                    │  └──────────────────┘                │
                    │    │           │                      │
                    │    ▼           ▼                      │
                    │  S3 Bucket   Secrets Manager          │
                    │  (images)    (credentials)            │
                    │                                      │
                    └─────────────────────────────────────┘

  GitHub Actions ──OIDC──► IAM Role ──► ECR Push + ECS Deploy
```

## Environment Separation

| Resource | Dev | Stg | Prod |
|----------|-----|-----|------|
| ECS Service | chon-dev-svc | (planned) | (planned) |
| Database | chondb (chon_dev user) | (planned) | (planned) |
| Secrets | chon/dev/backend | chon/stg/backend | (planned) |
| S3 Bucket | chon-images-dev | chon-images-stg | (planned) |
| ALB | shared (path-based) | shared | separate |

## Consequences

### Positive
- Company owns all infrastructure — no vendor dependency
- Environment isolation prevents cross-environment incidents
- Automated deployments reduce manual error and deployment time
- Secrets never appear in code, Docker images, or CI logs
- Cost-effective for a startup (~$52/mo for dev+stg)

### Negative
- Spring Boot cold start (145s) makes deployments slow on small Fargate tasks
- No HTTPS until domain is purchased
- Terraform state is local — needs migration to S3 for team use

### Risks
- Vendor code has a placeholder `SecurityConfig.jwtDecoder()` pointing to a fake JWKS URL — needs cleanup after code handover
- The `uni_links` Flutter package was deprecated and replaced with `app_links` — vendor may reintroduce it on April 19

## Files Changed (Sprint 1: Apr 13–14)

### Backend (chon-backend)
- `Dockerfile` — Multi-stage Docker build (JDK 21 build + JRE 21 runtime)
- `pom.xml` — WAR→JAR packaging, added spring-boot-starter-actuator
- `.github/workflows/backend-ci.yml` — CI/CD pipeline
- `src/.../CustomHttpServletRequestWrapper.java` — Fixed NPE for bodyless requests
- `src/.../application-dev.properties` — Actuator config, externalized log path
- `infra/terraform/*.tf` — All AWS infrastructure (14 Terraform files)

### Mobile (chon-mobile)
- `.github/workflows/mobile-ci.yml` — Flutter CI pipeline
- `pubspec.yaml` — Replaced uni_links with app_links, fixed intl version
- `lib/flavors.dart` — Updated dev URL to company ALB
- `lib/.../uni_app.dart` — Migrated to app_links API
- `android/app/build.gradle` — Release signing config
- `android/app/chon-release.jks` — Release keystore (gitignored)
