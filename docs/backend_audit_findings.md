# Backend audit findings — 패치 결과 + 정책 이슈 인계

[`docs/backend_endpoint_audit.md`](./backend_endpoint_audit.md)에서 식별한 4건 중 코드 변경 가능한 2건은 이번 세션에 패치하고, 정책 이슈 2건은 인계합니다.

## ✅ 패치 완료

### 1. `RelationController.@DeleteMapping("delete/{id}")` → `"/delete/{id}"`

**전:** 슬래시가 빠져있어서 `@RequestMapping("/relation")`과 결합 시 경로 해석이 모호.
**후:** 일관성 있는 leading slash. 동작 변화 없음 (Spring은 양쪽 다 처리하지만 코드 스타일 통일).

📁 `backend/src/main/java/com/chon/api/controller/RelationController.java:38`

### 2. `SelfIdRepo.createCardSecond` `@Deprecated` 마커

백엔드에 `@PostMapping("/create/card-second")` 매핑이 없는데 mobile에 정의되어 있어서 호출 시 404. 다행히 *호출처도 0건* (dead code 상태).

**조치:** mobile 메서드에 `@Deprecated('Backend endpoint /identifier/create/card-second is not yet implemented')` 추가. analyzer 경고로 향후 사용 시도 차단. 백엔드 추가되면 deprecation 마커만 떼면 됨.

📁 `mobile/lib/domain/repositories/self_id_repo.dart:29-37`

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

### 4. `verifyDid` 응답 schema 호환성

mobile은 `Future<CardInfoItem> verifyDid(...)`로 받는데, backend `VerifyController.@GetMapping("/verify-did")`의 실제 응답 wrapper(`ResponseData<...>` vs raw)와 모바일 모델(`CardInfoItem`) JSON 스키마 일치 여부 확인 필요.

→ **액션:** Postman / Swagger UI에서 `GET /verify/verify-did?token=<sample>` 호출 → 응답 JSON과 [`CardInfoItem` Freezed 정의](../mobile/lib/data/models/self_id/list_card_info_model.dart)의 `@JsonKey` 필드 매칭 검증.

## 🔍 다음 세션 추가 검토 후보

### A. `GoRouter` redirect와 `AuthGuard.guard` 재확인

라우터 v2 라우트들에 `redirect: AuthGuard.guard` 적용 — `/v2/idGeneration` 같은 경로도 토큰 필수. 그런데 `/identifier/create/card`(백엔드)는 토큰 없이도 호출 가능하므로 모바일 `Routes.idGenerationV2`까지 도달 *전*에 토큰 발급되는 흐름이 보장돼야 합니다.

### B. `createCardSecond` 백엔드 구현 여부

비즈니스 로직: 첫 카드 발급(`/create/card`) → "second" pass에서 보강 정보 저장? 아니면 두 번째 카드(예: 가족 카드)? 인계 가능한 비즈니스 컨텍스트 확보 후 backend service 메서드로 추가.

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
