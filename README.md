# CHON DID

CHON DID family tree platform monorepo. Contains the Spring Boot backend and the Flutter mobile client.

## Repository layout

```
.
├── backend/   # Spring Boot 3.2.5 / Java 21 / MariaDB
└── mobile/    # Flutter 3.29.3 / Dart ^3.6.0
```

Each subdirectory keeps its own README, CI workflows, and deployment configuration.

- Backend: [`backend/README.md`](./backend/README.md)
- Mobile: [`mobile/README.md`](./mobile/README.md)

## Stack at a glance

| Area | Technology |
|------|------------|
| Backend | Java 21, Spring Boot 3.2.5, Maven, Spring Data JPA, Spring Security + OAuth2, MariaDB |
| Mobile | Flutter 3.29.3 (FVM), BLoC/Cubit, Dio + Retrofit, go_router, 6 locales (en, ko, vi, ja, zh_CN, zh_TW) |
| Cloud | AWS ap-northeast-2 — ECS Fargate, RDS MariaDB, ALB, S3, Secrets Manager, ECR, CloudWatch (Terraform) |
| CI/CD | GitHub Actions, OIDC for AWS, Firebase App Distribution + Google Play internal track for mobile |

## Branch strategy

| Branch | Purpose |
|--------|---------|
| `main` | Production-ready code. Auto-deploys backend to ECS, ships mobile prod AAB to Google Play internal track. |
| `stg` | Staging / UAT for mobile (Firebase App Distribution). |
| `dev` | Daily development. Backend runs CI only. Mobile ships dev APK to Firebase. |
| `vendor/final-delivery` | Vendor handover branch. |

Workflow: `dev` → `stg` (mobile UAT) → PR → `main`.

## Functional areas

Identifier / card certificate management, clan / family certificate management, family tree (relation), verification & signature flows, event management & attendance, image serving.

## External services

MariaDB (RDS), S3 (image storage), Yandex SMTP, DID issuer service, OpenAI (chatbot), Naver Cloud OCR.

## Secrets

Never commit credentials, RSA keys, mail credentials, DID tokens, encryption keys, keystores, or `.env` files. See each subproject's README for the full secret inventory and rotation list.

## Note on the chon-home repository

`https://github.com/hobbong21/chon-home.git` is a **separate** repository hosting the CHON marketing website (HTML/CSS/JS). It is unrelated to this DID monorepo. Do not push here from there or vice versa.
