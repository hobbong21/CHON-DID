# verifyDid 옵션 A — PR 초안

> **목적**: [`docs/verify_did_schema_audit.md`](./verify_did_schema_audit.md) 의 옵션 A (backend `VerifyDIDDTO` 확장) 를 채택했을 때 즉시 적용 가능한 PR 초안.
>
> 이 문서를 채택 결정 즉시 PR 본문 / 디자인 문서로 사용. 코드 변경은 백엔드 + (선택적) 모바일 모델 정리 두 단계로 분리.

## TL;DR

backend `VerifyDIDDTO` (현재 4 필드) → **`CardInfoEntity` 의 모든 read-safe 필드** 로 확장하면 mobile `CardInfoItem` Freezed 모델이 자동으로 잘 파싱됨. 모바일 변경 0건. PII 마스킹 정책에 따라 `idNumber`, `phoneNumber` 는 마스킹 변형으로 응답 (예: `820701-2******`).

## PR 제목

```
feat(backend): /verify/verify-did 응답 schema 확장 + PII 마스킹
```

## PR 본문 (복붙용)

```markdown
## What

`/verify/verify-did?token=...` 응답 DTO `VerifyDIDDTO` 가 4 필드만 반환하고 있어서 mobile `CardInfoItem` (19 필드) 로 파싱되면 14개 필드가 모두 null 로 들어옴. 그 결과 mutual_auth_offline_scan_page 가 "이름: -" / DID hash 만 표시 — 사용자 가시 데이터 누락 발생.

## Why

audit 문서 [`docs/verify_did_schema_audit.md`](./verify_did_schema_audit.md) 에서 mismatch 사전 분석. 옵션 A (backend 확장) 채택 사유:
- 사용자 UX 회복 (스캔한 카드의 이름 + 마스킹된 ID 가 표시되어야 함)
- mobile freezed 모델 변경 0건
- backend 서비스 로직은 이미 풀 `CardInfoEntity` 를 fetch 하고 있어 ModelMapper 가 자동 매핑

## How

1. `VerifyDIDDTO` 에 mobile `CardInfoItem` 필드 14개 추가
2. PII 필드는 마스킹된 형태로 채우는 헬퍼 추가 (`maskIdNumber`, `maskPhoneNumber`)
3. `getDidInfoByToken` 에서 마스킹 적용 후 응답
4. integration test 1건 추가 (verify-did 호출 시 name + 마스킹된 idNumber 가 응답에 있는지)

## Diff

`backend/src/main/java/com/chon/api/model/identifier/VerifyDIDDTO.java`:

```diff
@@ VerifyDIDDTO.java
 @Data
 @NoArgsConstructor
 @AllArgsConstructor
 public class VerifyDIDDTO {
     private Long cardInfoId;
     private String txId;
     private String blockHeight;
     private String did;
+
+    // --- mobile `CardInfoItem` 매칭 필드 (2026-XX-XX 추가) ---
+    private String name;
+    private String idNumber;          // 마스킹: 6자리-7자리 → 6자리-1자리+******
+    private String address;
+    private String issuingAuthority;
+    private String issuedDate;
+    private String gender;
+    private String nationality;
+    private String refVisaType;
+    private String phoneNumber;       // 마스킹: 끝 4자리 ****
+    private String imgPath;
+    private String digitalSignature;
+    private Long pointVerify;
+    private Long status;
+    private String qrCode;            // entity 에 없으면 share-link wrapper 에서 도출
+    private String shareLink;         // entity 에 없으면 service 에서 생성
 }
```

`backend/src/main/java/com/chon/api/service/impl/VerifyServiceImpl.java`:

```diff
@@ VerifyServiceImpl.java:382-384
-        VerifyDIDDTO res = ModelMapperUtils.toObject(card, VerifyDIDDTO.class);
-        res.setCardInfoId(card.getId());
-        return res;
+        VerifyDIDDTO res = ModelMapperUtils.toObject(card, VerifyDIDDTO.class);
+        res.setCardInfoId(card.getId());
+        // PII 마스킹 — 검증 응답은 카드 진위 확인용이므로 raw PII 노출 금지
+        res.setIdNumber(PiiMaskingUtils.maskIdNumber(card.getIdNumber()));
+        res.setPhoneNumber(PiiMaskingUtils.maskPhoneNumber(card.getPhoneNumber()));
+        return res;
```

`backend/src/main/java/com/chon/api/util/PiiMaskingUtils.java` (신규):

```java
package com.chon.api.util;

/// PII masking helpers for verify-flow responses.
///
/// The `/verify/*` endpoints return *attestation* data — proof that a card
/// exists and was issued — not the raw card content. So even though the
/// caller is authenticated through a verify-link token, we must not echo
/// raw PII back. These helpers preserve enough of each value for the human
/// reader to recognise it ("the card I scanned is mine") without leaking
/// the full document.
public final class PiiMaskingUtils {
    private PiiMaskingUtils() {}

    /// Korean RRN (`820701-2345678`) → `820701-2******`
    public static String maskIdNumber(String raw) {
        if (raw == null || raw.length() < 8) return raw;
        // Preserve YYMMDD-G (7 chars) + mask the last 6
        int dashIdx = raw.indexOf('-');
        if (dashIdx < 0 || dashIdx + 1 >= raw.length()) return raw;
        String prefix = raw.substring(0, dashIdx + 2); // 6 digits + dash + gender digit
        return prefix + "*".repeat(Math.max(0, raw.length() - prefix.length()));
    }

    /// Phone (`010-1234-5678` or `01012345678`) → `010-****-5678`.
    public static String maskPhoneNumber(String raw) {
        if (raw == null || raw.length() < 8) return raw;
        // Strip non-digits, mask middle 4
        String digits = raw.replaceAll("\\D", "");
        if (digits.length() < 8) return raw;
        int prefixLen = digits.length() - 4;
        String prefix = digits.substring(0, Math.max(0, prefixLen - 4));
        String suffix = digits.substring(prefixLen);
        return prefix + "****" + suffix;
    }
}
```

## Test

신규 unit test `PiiMaskingUtilsTest`:

```java
package com.chon.api.util;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class PiiMaskingUtilsTest {
    @Test void maskIdNumber_preservesPrefixAndGenderDigit() {
        assertEquals("820701-2******", PiiMaskingUtils.maskIdNumber("820701-2345678"));
    }

    @Test void maskIdNumber_returnsRawWhenMalformed() {
        assertEquals("invalid", PiiMaskingUtils.maskIdNumber("invalid"));
        assertNull(PiiMaskingUtils.maskIdNumber(null));
    }

    @Test void maskPhoneNumber_masksMiddleFour() {
        assertEquals("010****5678", PiiMaskingUtils.maskPhoneNumber("01012345678"));
        assertEquals("010****5678", PiiMaskingUtils.maskPhoneNumber("010-1234-5678"));
    }
}
```

신규 integration test `VerifyControllerIntegrationTest`:

```java
@Test
void verifyDid_returnsExpandedDtoWithMaskedPii() throws Exception {
    // given: 토큰 생성
    String token = EncryptionUtils.encrypt(
        new VerifyLinkModel(cardId, ECommon.VERIFY_TYPE.CARD.value),
        appProperties.encryptKey);

    // when
    MvcResult result = mockMvc.perform(get("/verify/verify-did")
            .param("token", token))
        .andExpect(status().isOk())
        .andReturn();

    // then: 응답에 name + 마스킹된 idNumber 가 있어야 함
    String json = result.getResponse().getContentAsString();
    assertThat(json).contains("\"name\":\"홍길동\"");
    assertThat(json).contains("\"idNumber\":\"820701-2******\"");
    assertThat(json).doesNotContain("820701-2345678"); // raw 누출 방지
}
```

## Mobile 영향

`CardInfoItem` Freezed 모델 변경 없음 — 이미 모든 필드가 nullable 이라 backend 가 채우든 안 채우든 호환.

다만 새로 채워진 데이터 검증 위해 `mutual_auth_offline_scan_page_test.dart` 또는 신규 integration test 권장:

```dart
// mobile/integration_test/mutual_auth_offline_verify_flow_test.dart
testWidgets('스캔 + verifyDid → 마스킹된 이름/ID 표시', (tester) async {
  when(() => verifyRepo.verifyDid(token: any(named: 'token')))
      .thenAnswer((_) async => const CardInfoItem(
            id: 1,
            name: '홍길동',
            idNumber: '820701-2******',
            did: 'did:chon:abc',
          ));
  // ... pump scan page, verify name + masked idNumber in DOM ...
  expect(find.text('홍길동'), findsOneWidget);
  expect(find.text('820701-2******'), findsOneWidget);
});
```

## Risk

- 🟢 **Low**: 모든 필드가 `CardInfoEntity` 에 이미 존재 — DB 변경 없음.
- 🟡 **Medium**: PII 마스킹 정책이 frontend 와 정합해야 함. 마스킹 규칙은 보안팀 검토 권장.
- 🟢 **Low**: 모바일 호환성 — Freezed nullable 이라 회귀 0.

## Rollout

1. PR 머지 → dev 배포 → Postman 으로 응답 직접 확인
2. mobile dev 빌드로 mutual_auth_offline 흐름 수동 테스트 (이름이 보이는지)
3. live 배포

## 마스킹 정책 — 보안팀 확인 필요

위 마스킹 규칙은 *제안*. 보안팀과 합의 후 채택:

| 필드 | 제안 마스킹 | 대안 |
|------|------------|------|
| `idNumber` | `820701-2******` (앞 7자리 보존, 뒤 6자리 마스킹) | `8207**-2******` (생년월일도 부분 마스킹) |
| `phoneNumber` | `010****5678` (앞뒤 보존, 가운데 마스킹) | `010-****-****` (뒷자리도 마스킹) |
| `address` | 풀 노출 | 동/번지는 마스킹 (`행복특별시 행복한구 행*** 1길` 등) |
| `name` | 풀 노출 (검증의 핵심) | (마스킹하지 않음) |

검증 흐름의 핵심이 "스캔한 카드의 주인을 확인" 이므로 `name` 은 마스킹 불가. 그 외 필드는 정책에 따라 조정.
```

## 적용 후 후속

1. 머지 후 [`docs/backend_audit_findings.md`](./backend_audit_findings.md) 정책 이슈 4 항목 *해결 완료* 로 마크
2. [`docs/verify_did_schema_audit.md`](./verify_did_schema_audit.md) 의 옵션 A 채택 + PR 링크 표기
3. mobile 의 mutual_auth_offline_scan_page UI 가 회복된 데이터 (이름, 마스킹된 ID) 를 잘 보여주는지 dev build 수동 검증

## 옵션 A 가 *아닌* 다른 결정의 경우

- **옵션 B (mobile 모델 분리)** → 별도 PR. backend 변경 0, mobile 만 작업. mobile/lib/data/models/verify/verify_did_response.dart 신규 생성 + verify_repo.dart return type 변경. 사용자 UX 는 *최소 정보만* 표시 ("DID 검증 완료" + DID hash).
- **옵션 C (endpoint 분리)** → 더 큰 변경. `/verify/verify-did` 는 옵션 B 응답으로 두고, 풀 카드 정보가 필요하면 mobile 이 `/verify/get-card-info` 도 호출. latency + endpoint 수 늘어남.

각 옵션의 세부 분석은 audit 문서 본체에 있음.
