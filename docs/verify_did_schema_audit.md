# `verifyDid` schema 호환성 audit

> **작성일**: 2026-04-26
> **관련 audit**: [`docs/backend_audit_findings.md`](./backend_audit_findings.md) 항목 4 — verifyDid 응답 schema 호환성

이 문서는 audit 항목 4 ("Postman/Swagger UI 검증 후 모바일 모델과 매칭 확인") 의 **사전 분석 + 검증 절차** 를 제공합니다. 결론적으로 **이미 schema mismatch 가 존재함을 코드 비교로 확인** — Postman 호출은 그 mismatch 의 사용자 가시 영향을 정량 측정하기 위한 단계입니다.

## 결론 (사전 분석)

backend 응답과 mobile 파싱 모델 사이에 **field 18개 중 4개만 일치, 14개는 backend 가 제공하지 않음** (mobile freezed 가 nullable 이라 파싱은 성공하지만 14개 필드는 모두 null).

| Mobile `CardInfoItem` 필드 | backend `VerifyDIDDTO` 필드 | 매칭 |
|----------------------------|------------------------------|------|
| `id` | (없음 — backend 는 `cardInfoId`) | ❌ 키 이름 다름 |
| `pointVerify` | (없음) | ❌ |
| `imgPath` | (없음) | ❌ |
| `name` | (없음) | ❌ |
| `status` | (없음) | ❌ |
| `idNumber` | (없음) | ❌ |
| `gender` | (없음) | ❌ |
| `nationality` | (없음) | ❌ |
| `refVisaType` | (없음) | ❌ |
| `issuedDate` | (없음) | ❌ |
| `digitalSignature` | (없음) | ❌ |
| `phoneNumber` | (없음) | ❌ |
| `qrCode` | (없음) | ❌ |
| `shareLink` | (없음) | ❌ |
| `address` | (없음) | ❌ |
| `issuingAuthority` | (없음) | ❌ |
| `blockHeight` | `blockHeight` | ✅ |
| `txId` | `txId` | ✅ |
| `did` | `did` | ✅ |
| (없음) | `cardInfoId` | (backend extra; mobile 의 `id` 와 의미 동일하지만 키 다름) |

**파일 참조:**
- mobile: [`mobile/lib/data/models/self_id/list_card_info_model.dart:46-71`](../mobile/lib/data/models/self_id/list_card_info_model.dart)
- backend: [`backend/src/main/java/com/chon/api/model/identifier/VerifyDIDDTO.java`](../backend/src/main/java/com/chon/api/model/identifier/VerifyDIDDTO.java)

## 사용자 가시 영향

`VerifyRepo.verifyDid` 호출처 2곳:

### 1. `mutual_auth_offline_scan_page.dart` (오프라인 QR 스캔 결과)

[scan page result body](../mobile/lib/presentations/modules/mutual_auth_offline/mutual_auth_offline_scan_page.dart) 가 다음을 렌더:

```dart
Text(card?.name ?? '-')                          // → 항상 '-'
Text(card?.idNumber ?? card?.did ?? '-')         // → DID hash 표시 (idNumber null fallback)
```

**보이는 결과**: 스캔 성공 후 "이름: -", "ID: did:chon:xxxx..." 로 사용자에게 출력. 의도된 UX 가 *상대방 이름 + 주민등록번호 마스킹된 형태* 라면 현재는 실패.

### 2. `request_verification_cubit.dart`

[request_verification_cubit.dart:73](../mobile/lib/presentations/modules/request_verification/cubit/request_verification_cubit.dart) 에서 `verifyDid(token)` 결과를 사용. (legacy 모듈, v1) 동일한 mismatch 영향.

## 수정 옵션 (3안)

### 옵션 A — backend 가 풍부한 응답 반환 (권장)

`VerifyDIDDTO` 를 mobile 의 `CardInfoItem` 과 1:1 매칭되게 확장. service 가 token 으로 카드를 lookup 한 직후 풀 데이터를 응답.

**장점**: mobile 변경 0건, 사용자 가시 UX 회복.
**단점**: backend `VerifyService.getDidInfoByToken` 의 SELECT 컬럼 확장 + DTO 필드 추가. 검증 endpoint 가 *공개 검증* 컨텍스트에서 사용된다면 PII 노출 우려 — 인증 정책 확인 후 선택적 마스킹 (예: `idNumber` 는 마스킹된 형태로) 고려.

```java
// VerifyDIDDTO.java
@Data
public class VerifyDIDDTO {
    private Long cardInfoId;
    private String txId;
    private String blockHeight;
    private String did;
    // 신규 추가
    private String name;
    private String idNumber;       // 정책에 따라 마스킹 (예: "900101-1******")
    private String gender;
    private String nationality;
    private String issuedDate;
    private String issuingAuthority;
    private String imgPath;
    // ... CardInfoItem 의 나머지 필드
}
```

### 옵션 B — mobile 이 별도 작은 모델 사용

`VerifyDidResponse` Freezed 모델을 새로 정의 (4 필드: cardInfoId, txId, blockHeight, did). `verifyDid` 의 반환 타입을 그것으로 바꾸고 호출처에서 *표시할 필드가 없다는 사실을 명시*.

**장점**: backend 변경 0건. 모바일 모델이 실제 응답 그대로 정확히 표현.
**단점**: 사용자 UX 가 빈약해짐 — DID hash 만 노출, 검증된 상대방 정보 표시 불가. UI 설계가 정말 *DID 검증* 만 보여주는 게 의도라면 이 방향이 맞음.

```dart
// 신규 모델
@freezed
abstract class VerifyDidResponse with _$VerifyDidResponse {
  const factory VerifyDidResponse({
    @JsonKey(name: 'cardInfoId') int? cardInfoId,
    @JsonKey(name: 'txId') String? txId,
    @JsonKey(name: 'blockHeight') String? blockHeight,
    @JsonKey(name: 'did') String? did,
  }) = _VerifyDidResponse;
}

// verify_repo.dart
@GET(ApiEndpoints.verifyDid)
Future<VerifyDidResponse> verifyDid({@Query('token') required String token});
```

### 옵션 C — backend 가 mobile spec 에 맞춰 endpoint 분리

`/verify/verify-did` 는 옵션 B 그대로 (가벼움). 풀 카드 정보가 필요하면 `/verify/get-card-info?token=...` 라는 *별도 endpoint* 를 호출하도록 mobile 변경.

**장점**: 책임 분리 (DID 검증 vs 카드 상세 조회), 캐시 / 권한 정책을 endpoint 별로 다르게 적용 가능.
**단점**: mobile 흐름이 두 번 호출하게 되어 latency 증가. backend 도 endpoint 추가.

> **권장**: 사용자 UX 가 핵심이면 **옵션 A**, schema 정확성이 핵심이면 **옵션 B**, 장기 확장성을 보면 **옵션 C**.

## Postman / curl 검증 절차 (필수)

위 옵션 결정 *전에* 실제 응답을 확인해 분석이 맞는지 1차 검증:

### Step 1 — 토큰 발급

mutual auth flow 로 토큰을 1개 만든다. CHON 모바일 앱의 v2 mutual_auth_request 흐름을 끝까지 진행하거나, 백엔드 dev 환경에서 직접 카드 record 의 `share_token` 컬럼을 가져온다.

### Step 2 — verify-did 호출

```bash
# {{baseUrl}} = https://api-dev.chon.com/mcrs-api (또는 사용 중인 dev 호스트)
# {{token}} = 위에서 얻은 토큰

curl -X GET "{{baseUrl}}/verify/verify-did?token={{token}}" \
     -H "Accept: application/json" \
     | jq .
```

### Step 3 — 응답 비교

응답 JSON 의 `data` 필드(ResponseData wrapper 를 벗긴 후) 가 다음과 같으면 *분석 일치*:

```json
{
  "status": 200,
  "data": {
    "cardInfoId": 12345,
    "txId": "0xabc...",
    "blockHeight": "0x1f4...",
    "did": "did:chon:..."
  }
}
```

응답에 `name`, `idNumber`, `imgPath` 등이 *있으면* — 분석은 부분만 맞음. backend 가 `VerifyDIDDTO` 를 내부적으로 확장했거나 ResponseData 가 다른 wrapper 를 끼우고 있을 수 있음. 그 경우 실제 응답 그대로 캡처해서 mobile 모델 변경.

### Step 4 — 모바일 통합 회귀 테스트

옵션 적용 후:

```bash
cd mobile
fvm flutter test integration_test/mutual_auth_offline_qr_scan_flow_test.dart
```

(이 test 가 아직 없다면 생성. `mutual_auth_offline_cubit.dart` 의 verify 흐름 + scannedCard.name 검증.)

## 회귀 테스트 — 신규 추가 권장

옵션 A 채택 시 다음 integration test 추가:

```dart
// mobile/integration_test/mutual_auth_offline_verify_flow_test.dart
testWidgets('offline scan + verifyDid → name + idNumber 표시', (tester) async {
  final verifyRepo = _MockVerifyRepo();
  when(() => verifyRepo.verifyDid(token: any(named: 'token')))
      .thenAnswer((_) async => const CardInfoItem(
            id: 1,
            cardInfoId 키 → backend 변경 후 매핑되어 자동으로 id 로 들어옴,
            name: '홍길동',
            idNumber: '900101-1******',
            did: 'did:chon:abc123',
            blockHeight: '0x1f4',
            txId: '0xtx...',
          ));

  // ... pump scan page, simulate QR detection, verify name renders ...
  expect(find.text('홍길동'), findsOneWidget);
  expect(find.text('900101-1******'), findsOneWidget);
});
```

옵션 B 채택 시:

```dart
testWidgets('offline scan + verifyDid → DID hash 표시 (이름 없음 정상)', (tester) async {
  // 응답에 name 이 없는 것이 의도적 — UI 가 fallback 로 did 표시
  expect(find.textContaining('did:chon:'), findsOneWidget);
});
```

## 결정 양식 (백엔드/모바일 팀 인계용)

| 항목 | 결정 |
|------|------|
| 채택 옵션 | □ A (backend 확장) □ B (mobile 모델 분리) □ C (endpoint 분리) |
| 책임자 | (이름) |
| 마감일 | (날짜) |
| 영향 PR | (링크) |
| 회귀 테스트 추가 | □ 예 □ 아니오 |
| `docs/backend_audit_findings.md` 업데이트 | □ 완료 |

## 참고

이 mismatch 는 mobile freezed 가 *모든 필드를 nullable* 로 정의했기 때문에 *런타임 에러* 가 아닌 *사용자 가시 데이터 누락* 으로 나타나는 종류의 버그. analyzer / unit test / integration test 모두 통과 — 실제 호출해서 응답을 보지 않으면 발견되지 않음.

이런 isssue 를 미래에 자동 검출하려면:

1. **OpenAPI / Swagger 스펙 → 모바일 모델 codegen** — 백엔드의 actual response shape 을 모바일이 자동 import. 단일 진실 원천(SSOT) 화.
2. **backend → mobile contract test** — backend 의 controller test 에서 직렬화한 JSON 을 mobile 의 fromJson 에 통과시켜 결과를 expectation 에 비교.
3. **dev DB → live mock** — dev 환경의 sample 응답을 캡처해 mobile 의 `tester.runAsync(() => Dio + DioAdapter mock)` 패턴으로 통합 테스트.

방향 1 이 가장 ROI 가 높음 — backend 가 이미 OpenAPI annotation (`@Operation`) 사용 중. swagger-codegen / openapi-generator 의 dart-dio 플러그인으로 mobile 측 모델을 자동 생성하면 이런 mismatch 가 컴파일 타임에 잡힘.
