# oauth2.ignore-urls 보안 검토

> **작성일**: 2026-04-26
> **검토 범위**: `backend/src/main/resources/application-dev.properties` + `application-live.properties` 의 `oauth2.ignore-urls` 목록
> **상태**: 🟡 분석 완료, 보안 책임자 결재 대기

이 문서는 무인증 허용 경로 중 *비즈니스 의도 확인이 필요한* 3개 (그리고 발견한 추가 1개)에 대한 위험 분석 + 처리 권고안입니다. 결재가 끝나면 이 문서를 `docs/security/decisions/` 로 옮기고 GitHub PR 로 properties 변경 commit.

## 현재 ignore-urls (live + dev 동일)

```properties
oauth2.ignore-urls=
  /auth/login,
  /auth/login/2fa,
  /auth/refresh,
  /auth/logout,
  /auth/register/**,
  /auth/password/reset/**,
  /clan/create,                        ← ⚠️ 검토 필요
  /public/**,
  /share/verify-link,
  /event/web/**,
  /event/event-link,
  /category/list,
  /identifier/create/card,             ← ⚠️ 검토 필요
  /taekwondo/create/taekwondo,         ← ⚠️ 검토 필요
  /verify/integration-did,             ← (dev 전용 — live 에는 없음)
  /actuator/health,
  /invite.html
```

> dev 의 `/verify/integration-did` 는 live 에 없음 — dev 전용으로 의도된 듯하지만 그 자체로 정책 일관성 문제. 함께 검토 필요.

## 위험 분석 — 검토 대상 4건

각 경로마다: **비즈니스 의도 추정 → 무인증으로 노출되는 리소스 → 악용 시나리오 → 권고**.

### 1. `POST /identifier/create/card` — ID 카드 생성

**컨트롤러**: `CardInfoController.identifierCreate(IdentifierCreateReqModel)` ([line 38-41](../../backend/src/main/java/com/chon/api/controller/CardInfoController.java))

**비즈니스 의도 추정**

회원가입 직후 첫 카드를 자동 생성하기 위한 무인증 진입점일 가능성이 높음. 모바일 라우터 (`mobile/lib/router/app_navigator.dart`) 에서 `Routes.idGenerationV2` 는 `AuthGuard.guard` 가 걸려있어 토큰 없이는 도달할 수 없는데, 백엔드는 토큰 없이도 받음 — 이 mismatch 가 바로 위험 신호.

**무인증으로 노출되는 리소스**

`IdentifierCreateReqModel` 의 모든 필드: 이름, 주민등록번호, 인증된 가족 정보(인척 포함), 카드 발급 메타데이터. 즉 *민감한 PII (Personally Identifiable Information)* 가 인증되지 않은 요청 본문으로 들어옴.

**악용 시나리오**

- **불법 ID 카드 fabrication**: 외부 공격자가 임의 PII 로 카드를 무수히 생성. 실재하지 않는 인증 카드가 데이터베이스에 적재됨 → 신분 위조 / 보이스피싱 등의 도구로 활용
- **Resource exhaustion**: 인증 없이도 받기 때문에 DDoS / DB 채우기 공격 표면이 됨
- **타인 PII 등록**: 공격자 A 가 피해자 B 의 PII (주민등록번호 등) 를 입력해 카드 등록 → B 명의의 가짜 신분증 발급

**권고**

🔴 **권장: ignore-urls 에서 제거**. 인증된 사용자만 본인 카드를 생성하도록 제한.

회원가입 직후 자동 생성이 필수면 두 가지 대안:

1. **회원가입 endpoint 가 카드 생성까지 한 트랜잭션에서 처리** — `/auth/register` 의 응답으로 새 카드 정보 반환. 이 경로는 이미 무인증이지만 회원가입은 ratelimit 걸려있음 + 본인 정보만 입력 가능.
2. **회원가입 직후 발급된 access token 으로 `/identifier/create/card` 를 호출** — 토큰 발급 ↔ 카드 생성 사이 수 초의 race window 만 노출. 권한은 본인 자기 카드 생성에 한정.

옵션 2가 변경 폭이 작아 권장.

### 2. `POST /clan/create` — 가문 생성

**컨트롤러**: `ClanController.createClanInfo(ClanCreateReqModel)` ([line 27-30](../../backend/src/main/java/com/chon/api/controller/ClanController.java))

**비즈니스 의도 추정**

가문(클랜) 인증서 자체는 카드와 마찬가지로 *공식 인증된* DID 자산. 무인증 생성은 의도되지 않을 가능성이 큼 — 카드 생성과 동일하게 회원가입/온보딩 흐름의 일부일 가능성이 있으나, 모바일 v2 에는 가문 생성 흐름이 *아직* 없음.

**무인증으로 노출되는 리소스**

`ClanCreateReqModel` — 가문명, 본관(本貫), 시조(始祖), 발음, 영문명, 종친회 정보 등. 가문 자체는 PII 보다는 *공공성* 강한 데이터지만, 한 번 생성되면 그 가문에 대한 ownership / admin 권한 귀속 정책에 영향.

**악용 시나리오**

- **Squatting**: 공격자가 인기 본관(예: "전주 이씨") 을 선점 등록 → 정당한 종친회가 등록할 때 conflict / 협상 강요
- **Spam 가문**: 임의 문자열로 다수 가문 등록 → 데이터 정합성 훼손, 실 사용자에게 노출되는 검색 결과 오염
- **이름 충돌 / 도용**: 이미 등록된 종친회 이름과 유사한 이름으로 sub-brand 등록

**권고**

🔴 **권장: ignore-urls 에서 제거 + 추가로 admin role 제한 권장.** 가문 생성은 흔한 작업이 아니므로 `/clan/create` 는 인증된 사용자 + 별도 `CLAN_ADMIN` 권한 보유자만 허용되도록.

특수 케이스: 회원가입 시 종친회 가입 흐름이 있다면 (1) 회원가입 endpoint 가 가문 *조회* 기반 기존 가문 join, (2) 신규 가문 생성은 고객센터 신청 / 별도 어드민 흐름 — 둘로 분리.

### 3. `POST /taekwondo/create/taekwondo` — 태권도 단증 생성

**컨트롤러**: `TaekwondoController.taekwondoCreate(TaekwondoCreateReqModel)` ([line 29-32](../../backend/src/main/java/com/chon/api/controller/TaekwondoController.java))

**비즈니스 의도 추정**

CHON 의 sub-product 인 태권도 단증 인증서 발급. *공개적 발급* 으로 의도되었을 가능성과 *내부 도장 관리자에 의한 발급* 으로 의도되었을 가능성 둘 다 있음. 비즈니스 컨텍스트 확보 필요.

**무인증으로 노출되는 리소스**

`TaekwondoCreateReqModel` — 사용자 이름, 단증 등급, 발급 도장, 사범 정보, 사진. 즉 발급 주체와 수령 주체 양쪽 PII 모두 노출.

**악용 시나리오**

- **가짜 단증 발급**: 공격자가 본인을 9단으로 등록 → 도장 사범 행세 → 신뢰 기반 사기 (수련생 모집 등)
- **타 사범 명의 도용**: 정식 사범 이름을 발급자로 입력 → 실제 사범의 평판 훼손

**권고**

🟡 **사업 정책 확인 후 결정.**

- 시나리오 A — *공개 발급* 이 비즈니스 의도 (예: 누구나 자기 단증 self-claim 후 KTA 검증): 그대로 두되 ratelimit + 사후 검증 절차 명문화
- 시나리오 B — *도장 사범 권한자만 발급*: ignore-urls 에서 제거 + `INSTRUCTOR` role 보유자만 허용

대화로 의도 확인 한 줄: "단증 데이터를 자기 자신이 입력해서 등록하나요, 아니면 도장 측에서 등록하나요?"

### 4. `GET /verify/integration-did` (dev 전용, live 에 없음)

**컨트롤러**: `VerifyController` 내 `/integration-did` 매핑 (정확한 메서드는 검색 필요)

**비즈니스 의도 추정**

dev 환경 통합 테스트용 endpoint. live 에서 차단된 게 정상 — 하지만 dev 환경이 production 의 데이터에 접근하는 경우(예: replica DB 사용 dev), 무인증 노출은 그 자체로 위험.

**악용 시나리오**

- dev 환경 외부 노출 시 verify 흐름의 internal state inspection
- dev 데이터베이스가 live 의 PII subset 을 가지고 있으면 PII 누출

**권고**

🟢 **dev 전용 endpoint 라면 properties 에서 dev 만 살리는 것은 의도대로.** 단:

- dev 환경의 외부 노출 여부 확인 (sg-rules / Cloudflare Access / VPN)
- dev DB 가 prod 데이터의 anonymized subset 을 사용하는지 확인 — 아니면 raw 카피 사용 시 누출 위험

## 추가로 발견한 잠재 이슈

- `oauth2.ignore-urls` 에서 같은 list 가 dev + live 양쪽에 일부 차이만 있고 거의 동일 — 환경별 정책 분리 의도가 약함. 보안 점검 차원에서 production 전용 properties 는 별도 *minimal* list 유지 권장.
- `/auth/register/**` 는 무인증 허용이 정상이지만 wildcard `**` 가 너무 광범. 정확히 어떤 sub-paths 가 매핑돼있는지 controller 분석 후 좁히는 게 좋음.
- `/event/web/**`, `/public/**`, `/event/event-link` 도 wildcard. 같은 우려.

## 결재 양식 (보안팀 인계용)

| 경로 | 추정 의도 | 위험도 | 권고 | 결재 (예/아니오/보류) | 코멘트 |
|------|----------|--------|------|--------------------|--------|
| `POST /identifier/create/card` | 회원가입 직후 자동 카드 발급 | 🔴 High — PII + 위조 위험 | ignore-urls에서 제거, 회원가입 직후 토큰 사용 |  |  |
| `POST /clan/create` | 가문 생성 | 🔴 High — squatting / 이름 도용 | ignore-urls 제거 + CLAN_ADMIN 권한 |  |  |
| `POST /taekwondo/create/taekwondo` | 단증 발급 | 🟡 Medium — 비즈니스 의도 확인 필요 | A: 그대로 + ratelimit / B: INSTRUCTOR role |  |  |
| `GET /verify/integration-did` (dev) | 통합 테스트용 | 🟡 Medium — dev 환경 격리 의존 | dev 환경 외부 노출 + 데이터 anonymization 확인 |  |  |

결재 후 이 문서 하단에 결정 이력 작성 → `git mv docs/security/oauth2_ignore_urls_review.md docs/security/decisions/2026-04-XX_oauth2_ignore_urls.md`.

## 변경 적용 시 체크리스트

ignore-urls 에서 경로를 제거할 경우:

1. **모바일 사이드 검증** — 해당 경로를 호출하는 모바일 흐름이 있는지 (`mobile/lib/data/data_source/remote/api_endpoints.dart` grep)
   - `/identifier/create/card` → `ApiEndpoints.createSelfId` 사용. 모바일 라우터에 `AuthGuard.guard` 이미 적용되어 있으므로 토큰 없이 도달 X. 백엔드 ignore-urls 제거 시 호환성 OK.
   - `/clan/create` → 모바일 v2 에 호출처 없음. 안전.
   - `/taekwondo/create/taekwondo` → 모바일 v2 에 호출처 없음 (확인 필요). 시나리오 B 채택 시 모바일에 INSTRUCTOR role 검사 추가 필요.

2. **dev / live properties 동시 변경** — 보안 정책은 환경 간 일관성 유지가 원칙. 차이가 의도된 경우 (예: dev 만 추가 endpoint) 별도 코멘트로 명시.

3. **Postman / Swagger UI 회귀 테스트** — 토큰 없이 호출 시 401, 토큰 있으면 200 / 적절한 200 / 200 (권한 매트릭스에 따라) 확인.

4. **rolling 배포** — 이미 호출 중인 클라이언트가 있을 수 있으니 (older 모바일 빌드, 외부 API 사용자), live 적용 전에 1주일 버전 호환 공지 권장.

## 다음 액션

- [ ] 보안 책임자에게 이 문서 링크 전달, 위 결재 양식 작성 요청
- [ ] 결정에 따라 properties 변경 PR 작성
- [ ] 변경 후 `docs/security/decisions/` 에 결정 이력 보관
- [ ] [`docs/backend_audit_findings.md`](../backend_audit_findings.md) 의 "정책 이슈 3" 항목을 결정 이력으로 갱신
