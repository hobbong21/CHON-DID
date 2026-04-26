# Backend audit findings — 패치 결과 + 정책 이슈 인계

[`docs/backend_endpoint_audit.md`](./backend_endpoint_audit.md)에서 식별한 4건 중 코드 변경 가능한 2건은 이번 세션에 패치하고, 정책 이슈 2건은 인계합니다.

## ✅ 패치 완료

### 1. `RelationController.@DeleteMapping("delete/{id}")` → `"/delete/{id}"`

**전:** 슬래시가 빠져있어서 `@RequestMapping("/relation")`과 결합 시 경로 해석이 모호.
**후:** 일관성 있는 leading slash. 동작 변화 없음 (Spring은 양쪽 다 처리하지만 코드 스타일 통일).

📁 `backend/src/main/java/com/chon/api/controller/RelationController.java:38`

### 2. `SelfIdRepo.createCardSecond` 제거 (2026-04-26 마감)

**1차 조치 (이전 세션):** `@Deprecated('Backend endpoint /identifier/create/card-second is not yet implemented')` 마커 추가 — analyzer 경고로 향후 사용 시도 차단.

**2차 조치 (이번 세션, 마감):** 호출처 0건 dead code로 확정 → 메서드, `.g.dart` 구현, `ApiEndpoints.createSecond` 상수 모두 삭제. 백엔드에서 추후 추가될 경우 `git revert` 또는 git history 참조하여 재추가 가능 (코드는 단순한 retrofit POST 매핑이라 재구성 비용 작음).

📁 `mobile/lib/domain/repositories/self_id_repo.dart` — 메서드 본문 삭제, NOTE 주석으로 history 보존
📁 `mobile/lib/domain/repositories/self_id_repo.g.dart` — 생성된 구현 함께 삭제 (다음 build_runner 실행 시 일관 유지)
📁 `mobile/lib/data/data_source/remote/api_endpoints.dart` — `createSecond` 상수 삭제, NOTE 주석 보존

## 🟡 정책 이슈 — 백엔드 PR 또는 보안 검토 필요

### 3. `oauth2.ignore-urls` 보안 검토 권장

`backend/src/main/resources/application-dev.properties`의 ignore-urls 목록 중 다음이 신중한 검토 필요합니다:

```properties
oauth2.ignore-urls=/auth/login,/auth/login/2fa,/auth/refresh,/auth/logout,
                   /auth/register/**,/auth/password/reset/**,
                   /clan/create,                                  ← ⚠️
                   /public/**,/share/verify-link,
                   /event/web/**,/event/event-link,
                   /category/list,
                   /identifier/create/card,                       ← ⚠️
                   /taekwondo/create/taekwondo,                   ← ⚠️
                   /verify/integration-did,
                   /actuator/health,/invite.html
```

**위험 후보:**

| 경로 | 우려 |
|---|---|
| `/identifier/create/card` | ID 카드 생성이 인증 없이 가능. 회원가입 직후 첫 카드 자동 생성용일 가능성. 누가 *어떻게* 이 경로를 호출하는 지 명확히 회사 내 정책 문서로 정리 권장 |
| `/clan/create` | 가문 생성 인증 없이 가능. 동일 |
| `/taekwondo/create/taekwondo` | 태권도 단증 생성 인증 없이 가능. 인증서가 *공개* 발급되는 게 비즈니스 의도면 OK, 아니면 토큰 필수로 |

→ **액션:** 보안 책임자에게 위 3개 경로의 무인증 허용이 의도된 정책인지 확인. 의도되지 않았으면 ignore-urls에서 제거 + 401 응답 처리.

### 4. `verifyDid` 응답 schema 호환성 (2026-04-26 사전 분석 완료)

mobile 은 `Future<CardInfoItem> verifyDid(...)`로 받는데, backend 는 `VerifyDIDDTO` (4 필드만) 반환.

🔴 **확인된 mismatch**: 18 필드 중 3 필드(`txId`, `blockHeight`, `did`)만 일치. mobile 의 `name`, `idNumber`, `imgPath` 등은 항상 null 로 들어와서 `mutual_auth_offline_scan_page` 가 "이름: -" 로 렌더되고 있을 가능성 높음.

→ **상세 분석 + 수정 옵션 (A/B/C) + Postman 검증 절차**: [`docs/verify_did_schema_audit.md`](./verify_did_schema_audit.md)

→ **다음 액션**: 백엔드/모바일 팀이 옵션 A (backend 확장 — 사용자 UX 회복) 또는 B (mobile 모델 축소 — schema 정확성) 중 결정. 결정 시 회귀 integration test 추가 권장.

## 🔍 다음 세션 추가 검토 후보

### A. `GoRouter` redirect와 `AuthGuard.guard` 재확인

라우터 v2 라우트들에 `redirect: AuthGuard.guard` 적용 — `/v2/idGeneration` 같은 경로도 토큰 필수. 그런데 `/identifier/create/card`(백엔드)는 토큰 없이도 호출 가능하므로 모바일 `Routes.idGenerationV2`까지 도달 *전*에 토큰 발급되는 흐름이 보장돼야 합니다.

### B. `createCardSecond` 백엔드 구현 여부 (2026-04-26 종결)

✅ **결정:** mobile dead code 제거 (위 항목 2 참조). 비즈니스 컨텍스트가 명확해진 이후 필요해지면 backend + mobile 양쪽을 같이 추가하는 흐름으로 재시작.

### C. CI에서 endpoint 매트릭스 자동 검증

`backend/src/main/java/com/chon/api/controller/*.java`의 `@*Mapping` 추출 + `mobile/lib/data/data_source/remote/api_endpoints.dart` 비교를 GitHub Actions step으로 추가 가능. mismatch 발견 시 CI 실패.

```yaml
- name: Endpoint cross-check
  run: python tools/check_endpoints.py
```

## 변경 요약 (이번 세션)

| 파일 | 변경 |
|------|------|
| `backend/src/main/java/com/chon/api/controller/RelationController.java` | `delete/{id}` → `/delete/{id}` (slash 통일) |
| `mobile/lib/domain/repositories/self_id_repo.dart` | `createCardSecond`에 `@Deprecated` 마커 + 주석 |
| `docs/backend_audit_findings.md` (이 파일) | 정책 이슈 3, 4 인계 |

## 변경 요약 (2026-04-26 추가 마감 작업)

| 파일 | 변경 |
|------|------|
| `mobile/lib/domain/repositories/self_id_repo.dart` | `createCardSecond` 메서드 삭제 — NOTE 주석으로 history 보존 |
| `mobile/lib/domain/repositories/self_id_repo.g.dart` | 생성 구현 함께 삭제 |
| `mobile/lib/data/data_source/remote/api_endpoints.dart` | `createSecond` 상수 삭제 |
| `docs/backend_endpoint_audit.md` | `createCardSecond` 행 — 종결 표시 |
| `docs/backend_audit_findings.md` (이 파일) | 후속 후보 B 종결 |
