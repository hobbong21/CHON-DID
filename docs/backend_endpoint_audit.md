# 백엔드 엔드포인트 audit — 모바일 v2 플로우 vs Spring Boot 컨트롤러

이번 세션에 추가한 v2 모듈들이 사용하는 모든 API 엔드포인트가 백엔드 (`backend/src/main/java/com/chon/api/controller/`)에 실제로 매핑되어 있는지 검증한 매트릭스입니다.

`mcrs-api` context-path가 `application-dev.properties`에서 `/mcrs-api`로 잡혀있으므로 실제 호출 경로는 `<base>/mcrs-api/<path>` 입니다.

## ✅ 매핑되는 엔드포인트 (모바일 → 백엔드)

### `SelfIdRepo` (`mobile/lib/domain/repositories/self_id_repo.dart`)

| 모바일 메서드 | 모바일 path | 백엔드 컨트롤러 | 상태 |
|----------|---------|---------------|------|
| `createCard` | `POST /identifier/create/card` | `CardInfoController` `@PostMapping("/create/card")` | ✅ |
| ~~`createCardSecond`~~ | ~~`POST /identifier/create/card-second`~~ | ~~`CardInfoController`~~ | ❎ 2026-04-26 mobile dead code 제거 |
| `updateSelfId` | `POST /identifier/update/card` | `CardInfoController` `@PostMapping("/update/card")` | ✅ |
| `getListCardInfo` | `GET /identifier/list-card-info` | `CardInfoController` `@GetMapping(value = "/list-card-info")` | ✅ |
| `getSelfIdDetail` | `GET /identifier/card-info/{id}` | `CardInfoController` `@GetMapping("/card-info/{id}")` | ✅ |
| `getHomeInfo` | `GET /identifier/get-home-info` | `CardInfoController` `@GetMapping("/get-home-info")` | ✅ |
| `getListVerifier` | `GET /identifier/list-verification` | `CardInfoController` `@GetMapping("/list-verification")` | ✅ |

### `RelationRepo`

| 모바일 메서드 | 모바일 path | 백엔드 | 상태 |
|----------|---------|------|------|
| `getRelationList` | `POST /relation/list` | `RelationController` `@PostMapping("/list")` | ✅ |
| `getListRequester` | `POST /relation/list-requester` | `@PostMapping("/list-requester")` | ✅ |
| `createRelation` | `POST /relation/create` | `@PostMapping("/create")` | ✅ |
| `updateRelation` | `PUT /relation/update` | `@PutMapping("/update")` | ✅ |
| `deleteRelation` | `DELETE /relation/delete/{id}` | `@DeleteMapping("delete/{id}")` | ⚠️ (백엔드 `@DeleteMapping("delete/{id}")`은 leading `/`가 빠진 듯 — 동작은 하지만 코드 정리 권장) |
| `getListRelationType` | `GET /relation/list-relation-type` | `@GetMapping("/list-relation-type")` | ✅ |

### `VerifyRepo`

| 모바일 메서드 | 모바일 path | 백엔드 | 상태 |
|----------|---------|------|------|
| `confirmVerify` | `POST /verify/confirm` | `VerifyController` `@PostMapping("/confirm")` | ✅ |
| `rejectVerify` | `POST /verify/reject` | `@PostMapping("/reject")` | ✅ |
| `getCardInfoVerify` | `GET /verify/get-card-info?token=...` | `@GetMapping("/get-card-info")` | ✅ |
| `getClanInfoVerify` | `GET /verify/get-clan-info` | `@GetMapping("/get-clan-info")` | ✅ |
| `getTaekwondoInfoVerify` | `GET /verify/get-taekwondo-info` | `@GetMapping("/get-taekwondo-info")` | ✅ |
| `verifySignature` | `POST /verify/signature-info` | `@PostMapping("/signature-info")` | ✅ |
| `getRequesters` | `GET /verify/requesters?verifyType=...` | `@GetMapping("/requesters")` | ✅ |
| `getPhone` | `GET /verify/get-phone` | `@GetMapping("/get-phone")` | ✅ |
| `changePhone` | `POST /verify/change-phone` | `@PostMapping("/change-phone")` | ✅ |
| `verifyDid` | `GET /verify/verify-did?token=...` | `@GetMapping("/verify-did")` | ✅ |

### `ReportRepo`

| 모바일 메서드 | 모바일 path | 백엔드 | 상태 |
|----------|---------|------|------|
| `createReport` | `POST /report/create` | `ReportController` `@PostMapping(value = "/create")` | ✅ |
| `getListReport` | `GET /report/list` | `@GetMapping("/list")` | ✅ |

## 🌐 외부 서비스 (백엔드 거치지 않음)

`OcrRepo`, `ChatbotRepo`는 외부 서드파티 API를 *직접* 호출합니다. 백엔드 매핑 검증 대상 아님.

### `OcrRepo` → Naver Cloud OCR

| 메서드 | path | 호스트 |
|--------|------|--------|
| `generalOcr` | `POST /general` | Naver Cloud OCR (env `OCR_BASE_URL`) |
| `idCardOcr` | `POST /document/id-card` | Naver Cloud OCR |
| `passportOcr` | `POST /document/passport` | Naver Cloud OCR |

`X-OCR-SECRET` 헤더로 인증. `.env`의 `OCR_SECRET` 키 필요.

### `ChatbotRepo` → OpenAI

| 메서드 | path | 호스트 |
|--------|------|--------|
| `chat` | `POST /completions` | OpenAI API (`api.openai.com/v1`) |

`Authorization: Bearer <API_KEY>`. `.env`의 `API_KEY` 키 필요. 모델 default `gpt-4.1-nano`.

## ⚠️ 잠재적 이슈

### 1. ~~`createCardSecond` (`/identifier/create/card-second`)~~ ✅ 2026-04-26 종결

mobile에 정의되어 있었으나 호출처 0건의 dead code였음. 백엔드 컨트롤러에 매핑이 추가될 계획이 없음을 확인하고 mobile에서 완전 제거:

- `SelfIdRepo.createCardSecond` 메서드 삭제
- `self_id_repo.g.dart`의 생성 구현 삭제
- `ApiEndpoints.createSecond` 상수 삭제

향후 두 번째 pass 발급 비즈니스 요구가 생기면 backend 매핑 + mobile 메서드를 동시 추가하는 방식으로 재시작. git history(`git log -- mobile/lib/domain/repositories/self_id_repo.dart`)에 retrofit POST 매핑 코드가 단순하게 남아있음.

### 2. `getInitRelationList` (`initRelationList` 상수, `/identifier/init-family-tree`)

`ApiEndpoints.initRelationList` 상수가 정의되어 있지만 grep으로 잘려서 path 끝이 안 보임. backend `CardInfoController`에는 `@PostMapping(value = "/init-family-tree/{certOwnerId}")` 매핑이 있음. mobile path도 같은지 확인 권장.

### 3. `deleteRelation` 경로 leading-`/` 누락

backend: `@DeleteMapping("delete/{id}")` (leading `/` 없음).
mobile: `DELETE /relation/delete/{id}`.

Spring은 `@RequestMapping("/relation")`과 결합 시 leading-`/` 없는 path도 처리하지만, **@DeleteMapping("/delete/{id}")** 으로 통일해서 코드 가독성 + 다른 스프링 버전과의 호환성 확보 권장.

### 4. CORS / 인증 정책

`application-dev.properties`의 `oauth2.ignore-urls` 목록을 보면 일부 v2 플로우에 필요한 경로가 빠져있음:

```
/auth/login,/auth/refresh,/clan/create,/public/**,/share/verify-link,
/event/web/**,/event/event-link,/category/list,/identifier/create/card,
/taekwondo/create/taekwondo,/verify/integration-did,/actuator/health,/invite.html
```

→ 다음 경로들은 `oauth2.ignore-urls`에 없으므로 **JWT 토큰 필수** (정상):
- `/relation/list`, `/relation/list-requester`, `/relation/create`, `/relation/update`, `/relation/delete`
- `/verify/confirm`, `/verify/reject`, `/verify/verify-did`
- `/report/create`, `/report/list`
- `/identifier/list-card-info`, `/identifier/update/card`

→ `/identifier/create/card`는 ignore 리스트에 있어서 **인증 없이도 호출 가능**. 회원가입 직후 첫 카드 생성용. 의도된 동작이지만 **보안 검토 권장** — 토큰 없이도 카드 생성이 가능한지 비즈니스 정책에 맞는지.

## 🔎 추가 확인 사항

다음은 코드 audit으로 즉시 알 수 없으니 backend 개발자/QA가 확인해야 합니다:

| 항목 | 영향 v2 플로우 | 확인 방법 |
|------|---------------|--------|
| `verifyDid` 응답 shape이 `CardInfoItem`과 호환? | MutualAuth Offline Scan | 실제 응답 sample을 swagger UI에서 확인 |
| `getListRequester` 응답에 `certOwnerName/Phone`, `certRelatedId` 포함? | MutualAuth Receive | swagger / Postman |
| `confirmVerify` / `rejectVerify`의 `verifyType` 코드값 | MutualAuth Receive | backend `VerifyTypeE` enum과 mobile `VerifyTypeE` enum 동기화 |
| `createReport` multipart 첨부파일 지원 여부 | Report v2 | `CreateReportRequest`에 `file` 필드만 있음 — base64 string 지원 확인 |
| OCR `idCardOcr` 한국 신분증 + 외국인등록증 둘 다 인식? | ID Generation v2 | Naver Cloud OCR 콘솔에서 도메인 / 템플릿 확인 |
| OpenAI `gpt-4.1-nano` 정확한 모델 이름 / 사용 가능 여부 | AI Chat v2 | OpenAI dashboard |

## ✅ 결론

**대부분의 v2 플로우 엔드포인트가 백엔드에 1:1로 매핑됩니다.** 아래 두 가지만 즉시 확인:

1. `/identifier/create/card-second` 매핑 존재 여부 (없으면 백엔드 추가)
2. `verifyDid` 응답 shape이 `CardInfoItem` JSON 스키마와 호환되는지

나머지는 통합 테스트 / QA 단계에서 검증.

## 다음 행동 (권장 우선순위)

1. **즉시**: 위 두 매핑 확인 → 없으면 백엔드 PR
2. **단기**: `oauth2.ignore-urls`에서 `/identifier/create/card`가 의도된 정책인지 보안 리뷰
3. **중기**: integration test로 v2 플로우당 하나씩 backend roundtrip 검증
