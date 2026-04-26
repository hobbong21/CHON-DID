# oauth2.ignore-urls — 결재 인계 자료

> **목적**: [`oauth2_ignore_urls_review.md`](./oauth2_ignore_urls_review.md) 의 분석을 바탕으로 보안 책임자에게 결재를 받기 위한 (1) 슬랙/이메일 메시지 초안, (2) 옵션별 properties 변경 diff 미리보기.

결재 후에는 이 문서의 "결정 이력" 섹션을 채워서 `docs/security/decisions/2026-XX-XX_oauth2_ignore_urls.md` 로 옮기고, 채택된 옵션의 diff 를 PR 로 제출.

## 슬랙 메시지 초안 (DM 또는 #security 채널)

```
@보안책임자 — CHON 백엔드의 무인증 endpoint 정책 검토 요청드립니다.

`application-{dev,live}.properties` 의 `oauth2.ignore-urls` 에 다음 4개 경로가
인증 토큰 없이 호출 가능 상태로 등록되어 있는데, 의도된 정책인지 확인 필요합니다.

1. `POST /identifier/create/card` — ID 카드 생성 (PII + 위조 위험 🔴)
2. `POST /clan/create` — 가문 생성 (squatting / 도용 위험 🔴)
3. `POST /taekwondo/create/taekwondo` — 단증 발급 (비즈니스 의도 확인 🟡)
4. `GET /verify/integration-did` — dev 전용 (환경 격리 의존 🟡)

상세 분석 + 위험 시나리오 + 옵션별 권고:
👉 docs/security/oauth2_ignore_urls_review.md

위 문서 안에 결재 양식 표가 있어요. 검토 + 코멘트 부탁드립니다.
적용까지 약 30분 작업 (옵션 결정 후 PR 작성 + properties 변경 + rolling 배포 공지).

급한 건 아니지만 다음 sprint planning 전까지는 결정되면 좋을 것 같아요.
```

이메일 변형 (보다 공식적):

> **Subject**: [CHON 보안 검토 요청] oauth2.ignore-urls 4개 경로 정책 확인
>
> 안녕하세요,
>
> CHON 백엔드 (`backend/src/main/resources/application-*.properties`)의 OAuth2 무인증 허용 목록 (`oauth2.ignore-urls`) 검토 요청드립니다. 현재 4개 경로가 토큰 없이 호출 가능한데, 비즈니스 의도와 보안 정책상 적절한지 확인이 필요합니다.
>
> - `POST /identifier/create/card` — ID 카드 생성
> - `POST /clan/create` — 가문 생성
> - `POST /taekwondo/create/taekwondo` — 단증 발급
> - `GET /verify/integration-did` — dev 환경 통합 테스트
>
> 각 경로의 노출 리소스, 잠재 악용 시나리오, 권고 옵션 (인증 필수 / 그대로 유지 + ratelimit / 권한 기반 분기) 은 첨부 문서 [`docs/security/oauth2_ignore_urls_review.md`](https://github.com/hobbong21/CHON-DID/blob/main/docs/security/oauth2_ignore_urls_review.md) 에 정리해두었습니다.
>
> 결재 양식이 문서 하단에 표 형태로 있으니, 각 항목별로 (예 / 아니오 / 보류) + 코멘트 작성해주시면 됩니다. 결정 후 properties 변경 PR 제출까지 백엔드 팀에서 약 30분 내 처리 가능합니다.
>
> 회신 기한: 다음 sprint planning (2026-MM-DD) 전까지 가능하시면 감사하겠습니다.
>
> 감사합니다.

## 옵션별 properties 변경 diff 미리보기

결재가 끝나면 채택된 옵션의 patch 를 그대로 PR 에 적용하면 됩니다. 4개 경로 각각 가능한 변경 안 + 라인 단위 diff:

### 옵션 1.A — `/identifier/create/card` 인증 필수로 전환

**채택 이유**: ID 카드는 PII 가 가득한 인증 자산이므로 무인증 생성은 위조 위험. 회원가입 직후 발급된 access token 으로 호출하도록 모바일 흐름 변경.

**Patch (`application-dev.properties`)**:
```diff
@@ application-dev.properties:130
-oauth2.ignore-urls=/auth/login,/auth/login/2fa,...,/category/list,/identifier/create/card,/taekwondo/create/taekwondo,/verify/integration-did,/actuator/health,/invite.html
+oauth2.ignore-urls=/auth/login,/auth/login/2fa,...,/category/list,/taekwondo/create/taekwondo,/verify/integration-did,/actuator/health,/invite.html
```

**Patch (`application-live.properties`)**: 동일하게 `/identifier/create/card` 만 제거.

**모바일 영향**: `mobile/lib/router/app_navigator.dart` 의 `Routes.idGenerationV2` 는 이미 `AuthGuard.guard` 로 보호 → 모바일 호출 흐름은 토큰 보유 상태에서 진행 → 백엔드가 인증을 요구해도 정상 동작. 회귀 위험 0.

**rolling 배포 공지**: 토큰 없이 `/identifier/create/card` 를 호출하던 외부 클라이언트가 있다면 (외부 통합?) 401 받기 시작 → 1주 사전 공지 권장.

### 옵션 1.B — `/identifier/create/card` 그대로 유지 (의도된 정책 확인)

회원가입 흐름 안에서 토큰 발급 *전* 카드 자동 생성이 비즈니스 의도라면 ignore-urls 유지. 단:
- ratelimit 추가 권장 (예: IP 당 분당 5회)
- 입력 검증 강화 — 회원 본인의 PII 만 등록 가능하도록 회원가입 토큰과 PII 매칭

이 경우 properties 변경 없음. 대신 `CardInfoService.identifierCreate` 에 ratelimit annotation + PII 매칭 검증 코드 추가.

### 옵션 2 — `/clan/create` 권한 기반 분기

**채택 이유**: 가문 생성은 squatting / 도용 위험이 큰 행위. 인증 + 별도 admin role 권장.

**Patch (`application-dev.properties` + `application-live.properties`)**:
```diff
-oauth2.ignore-urls=/auth/login,...,/clan/create,/public/**,...
+oauth2.ignore-urls=/auth/login,...,/public/**,...
```

추가 권장: `ClanController.createClanInfo` 에 Spring Security `@PreAuthorize("hasRole('CLAN_ADMIN')")` 추가. 이 부분은 별도 PR 로 분리 권장 (role 정의 + DB schema 변경 동반).

**모바일 영향**: 모바일 v2 에 가문 생성 흐름 없음 — 회귀 위험 0.

### 옵션 3 — `/taekwondo/create/taekwondo` 비즈니스 의도 확인 후 결정

추가 1줄 답변 필요: "단증 발급 데이터를 *누가* 입력하나요?"
- (A) 본인이 직접 self-claim → 그대로 두되 ratelimit + KTA 사후 검증 절차 명문화
- (B) 도장 사범이 등록 → ignore-urls 제거 + INSTRUCTOR role 도입

**Patch — 옵션 B 채택 시**:
```diff
-oauth2.ignore-urls=/auth/login,...,/taekwondo/create/taekwondo,/verify/integration-did,...
+oauth2.ignore-urls=/auth/login,...,/verify/integration-did,...
```

추가: `TaekwondoController.taekwondoCreate` 에 `@PreAuthorize("hasRole('INSTRUCTOR')")`. role 신규 정의 필요.

### 옵션 4 — `/verify/integration-did` (dev 전용) 점검

**현재 상태**: dev properties 에만 있고 live 에는 없음. dev 환경 외부 노출 + DB 데이터 anonymization 여부 확인이 키 포인트.

**점검 명령** (인프라 책임자에게 요청):
```bash
# dev 호스트가 외부 인터넷에 직접 노출되는지
nslookup api-dev.chon.com  # public IP 인지
curl -I https://api-dev.chon.com/mcrs-api/verify/integration-did?token=xxx  # 외부에서 호출 가능한지

# dev DB 가 prod 의 anonymized subset 인지
# → 인프라 책임자 / DBA 에게 확인
```

dev 환경이 VPN / Cloudflare Access 뒤에 있고 dev DB 가 anonymized 라면 **그대로 유지 가능** (현재 상태 유지).

외부 노출되어 있고 raw prod 데이터를 쓰면 **이 endpoint 를 dev properties 에서도 제거** 또는 dev 환경 자체를 격리.

## 결재 양식 (위 review 문서에서 복사 가능)

| 경로 | 추정 의도 | 위험도 | 결재 (예/아니오/보류) | 채택 옵션 | 코멘트 |
|------|----------|--------|--------------------|----------|--------|
| `POST /identifier/create/card` | 회원가입 직후 자동 카드 발급 | 🔴 High | | 1.A / 1.B | |
| `POST /clan/create` | 가문 생성 | 🔴 High | | 2 (권한) / 유지 | |
| `POST /taekwondo/create/taekwondo` | 단증 발급 | 🟡 Medium | | 3.A / 3.B | |
| `GET /verify/integration-did` (dev) | 통합 테스트용 | 🟡 Medium | | 4 (제거) / 유지 | |

## 결정 이력 (작성 후 채워주세요)

> 결정 일자:
> 결정자:
> 채택 옵션 (각 경로별):
> 1. `/identifier/create/card` →
> 2. `/clan/create` →
> 3. `/taekwondo/create/taekwondo` →
> 4. `/verify/integration-did` →
>
> 적용 PR: (링크)
> 회귀 테스트: (링크 / 결과)
> rolling 배포 공지일:

## 적용 후 작업

1. 위 옵션별 patch 를 `backend/src/main/resources/` 의 양 properties 에 적용
2. PR 제목: `security: 무인증 허용 endpoint 정책 정리 (oauth2.ignore-urls)`
3. PR 본문: 결재 결과 표 + 채택 옵션 + 영향 분석 (이 문서 링크)
4. 리뷰어: 보안 책임자 + 백엔드 팀 lead
5. 머지 후: `docs/security/oauth2_ignore_urls_review.md` 의 audit 항목을 *해결 완료* 로 마크 + `docs/backend_audit_findings.md` 의 정책 이슈 3 항목 갱신
6. 외부 통합 클라이언트 공지 (옵션 1.A 채택한 경우)
