# Section 3 — ID Generation 다음 세션 인계

CHON 1.1 페이지 Section 3 — 가장 큰 섹션(28 화면). 이번 세션에서는 **stage 머신 + 페이지 shell + 핵심 phase 4개**를 구현했고, 픽셀 정밀 변환은 다음 세션으로 인계합니다.

## 이번 세션 산출물

| 파일 | 역할 |
|------|------|
| [`mobile/lib/presentations/modules/id_generation_v2/cubit/id_generation_cubit.dart`](../../mobile/lib/presentations/modules/id_generation_v2/cubit/id_generation_cubit.dart) | 10-phase 머신, 선형 next/back/goTo, submit + createCard |
| [`mobile/lib/presentations/modules/id_generation_v2/cubit/id_generation_state.dart`](../../mobile/lib/presentations/modules/id_generation_v2/cubit/id_generation_state.dart) | `IdGenStage`, `IdGenType` enum, freezed state |
| [`mobile/lib/presentations/modules/id_generation_v2/id_generation_v2_page.dart`](../../mobile/lib/presentations/modules/id_generation_v2/id_generation_v2_page.dart) | shell + phase 별 leaf widget (start, personalInfo, verification, idType, review, done 풀 구현; 나머지 4개 phase는 stub) |
| [`mobile/test/presentations/modules/id_generation_v2/id_generation_cubit_test.dart`](../../mobile/test/presentations/modules/id_generation_v2/id_generation_cubit_test.dart) | navigation / phase mutations / submit 11 케이스 |

## 28개 Figma 프레임 → Phase 매핑

| Phase (코드) | Figma 프레임 | 구현 상태 |
|---|---|---|
| `start` | `ID_01` (`182:23526`) | ✅ 풀 구현 |
| `personalInfo` | `PP_01_1`~`_4` (`260:20879`, `300:3979`, `300:4018`, `300:4139`) | ✅ 풀 (단일 폼; Figma는 4-step) |
| `verificationOk` | `PP_02_OK_01` (`260:20344`), `PP_02_OK_F_01` (`260:21163`) | ✅ 풀 (성공/실패 분기) |
| `selectIdType` | `ID Gen_02` (`300:4231`) | ✅ 풀 (3 타입 선택 카드) |
| `capturePrep` | `ID Gen_03_01`~`_06` (`300:5122`, `300:5360`, `301:6407`, `182:21345`, `182:21311`, `182:21328`, `182:21275`) | 🚧 stub |
| `captureFront` | `ID Gen_03_02_01`, `_01_01`~`_01_04` (`301:6519`, `301:6833`, `301:9642`, `301:25075`, `301:25205`) | 🚧 stub (mobile_scanner / camera 미연결) |
| `captureBack` | `ID Gen_03_02_02`, `_02_01` (`301:6697`, `301:9740`) | 🚧 stub |
| `ocrConfirm` | `ID Gen_03_02_03`, `_03_01` (`301:6741`, `301:9828`) | 🚧 stub (기존 `ocr_id` 모듈 활용) |
| `review` | `ID Gen_03_02_04`, `_04_01`, `_04_02` (`301:6785`, `301:9995`, `301:24854`) | ✅ 풀 (단일 카드; Figma는 3 화면) |
| `done` | `ID Gen_04` (`301:26743`) | ✅ 풀 |

## 다음 세션 추천 작업 순서

### 1. capture phase 픽셀 정밀화

```
Figma 데스크톱에서 node 301:6519 (ID Gen_03_02_01) 선택
→ 채팅으로 "node 301:6519를 Flutter 코드로 변환해줘"
→ reference 코드 받아서 _CaptureFrontLeaf 위젯으로 정리
→ ChonColors / 공통 위젯으로 후처리
```

촬영 자체는 기존 `mobile_scanner` (이미 mutual_auth_offline에서 씀) 또는 `camera` 패키지 사용. 가이드 사각형(점선 윤곽선)은 `CustomPainter`로 그리거나 `Container` border로.

### 2. OCR 통합

기존 [`lib/presentations/modules/ocr_id/cubit/ocr_id_cubit.dart`](../../mobile/lib/presentations/modules/ocr_id/cubit/ocr_id_cubit.dart)에 OCR 호출 + `resolve_korean_data.dart`로 한국 신분증 파싱 로직이 이미 들어있음. 다음 세션에서:

- `OcrIdCubit`을 `IdGenerationCubit` 안에서 호출하거나
- `IdGenerationCubit`에 `OcrRepo`를 추가 주입하고 직접 호출

### 3. capturePrep / capturePrep 화면들 통합

현재 stub. Figma 6개 프레임(`ID Gen_03_01`~`_06`)이 어떤 안내 단계인지(예: "조명을 어둡게 해주세요", "신분증을 평평하게 두세요")는 Figma에서 직접 확인 필요.

### 4. 진행률 표시기 추가

10-phase 머신이라 사용자가 어디쯤 와있는지 알기 힘듦. AppBar 아래에 progress bar (선형) 또는 dot indicator (Tutorial 페이지에서 쓴 패턴) 추가 권장.

```dart
LinearProgressIndicator(
  value: state.stage.index / IdGenStage.values.length,
  backgroundColor: ChonColors.iconDisabledStrong.withValues(alpha: 0.2),
  valueColor: const AlwaysStoppedAnimation(ChonColors.brandPrimary),
)
```

### 5. 라우터 등록

현재 `Routes.ocrId` / `Routes.selfIdCreater`로 진입하는 기존 흐름이 있음. v2 활성화하려면:

1. 새 라우트 `Routes.idGenerationV2` 추가
2. `app_navigator.dart`에서 `IdGenerationV2Page(cubit: IdGenerationCubit(selfIdRepo: Injector.getIt<SelfIdRepo>()))` 빌더 등록
3. Home의 신분증 FAB onTap을 새 라우트로 교체

## 코드 리뷰 포인트

- **Cubit이 인메모리 상태** — 폼이 길어서 앱이 백그라운드 갔다가 돌아오면 입력값이 날아감. 다음 세션에서 `app_shared_preferences` 또는 임시 draft 저장 로직 추가 검토
- **이미지 base64 메모리 부담** — 신분증 한 장이 보통 수 MB. base64로 들고 있으면 메모리 압박. 큰 파일은 path/temporary file로 보관하고 base64는 submit 직전에만 만드는 게 좋음
- **Stub leaf의 onNext 리얼화** — `_StubLeaf`에서 base64를 `'stub-front-base64'` 같은 문자열로 채우고 있음. 실제 카메라 통합 후엔 진짜 캡처 데이터로 교체

## Cubit 테스트 커버리지

11 케이스, 모두 통과 가정:

- navigation: next 선형 / verificationFailed 시 다음 차단 / back / goTo
- phase mutations: onPersonalInfoChanged 부분 갱신 / markVerification 실패 / setFrontImage+setBackImage
- submit: 필수 누락 거부 / 성공 → done / 실패 → review 유지 with errorMessage

추가 테스트 권장 (다음 세션):
- 위젯 테스트 (각 phase leaf 렌더링 검증)
- OcrRepo 통합 후 OCR 결과 → personalInfo 자동 채움 케이스
- 카메라 권한 거부 시 stage 전환 처리
