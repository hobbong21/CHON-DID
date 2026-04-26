# ID Gen 카메라 phase 픽셀 정밀화 — 적용 완료 (2026-04-26)

> **2026-04-26 업데이트:** Figma `301:6519` (실제로는 ID 타입 picker) + `301:9642` (실제 카메라 화면) 노드를 받아 두 phase 를 픽셀 정밀화 완료. 아래 ## 적용 결과 섹션 참고. 인계 문서로 시작했지만 이번 세션에 적용까지 마쳤습니다. 잔여 노드(prep 6단계 + back/preview 변형)는 추가 작업 후보로 남아있습니다.

원래 상태(2026-04-25 작성): ID Generation v2의 카메라 캡처 phase는 **기능적으로 완성**되어 있었으나 Figma 픽셀 정합성 검토는 안 됐었음.

## 대상 Figma 프레임 (4개 phase, 11개 프레임)

[`docs/figma/index.md`](./index.md) Section 3에서 발췌:

### `capturePrep` — 안내 화면 6개

| 프레임 | nodeId | 추정 |
|---|---|---|
| ID Gen_03_01 | `300:5122` | 안내 1단계 |
| ID Gen_03 | `300:5360` | 안내 2 |
| ID Gen_03_02 | `301:6407` | 안내 3 |
| ID Gen_03_03 | `182:21345` | 안내 4 |
| ID Gen_03_04 | `182:21311` | 안내 5 |
| ID Gen_03_05 | `182:21328` | 안내 6 |
| ID Gen_03_06 | `182:21275` | 마지막 안내 |

> 6 sub-step이 정확히 어떤 안내인지 (조명·각도·반사 방지 같은 다른 토픽) Figma에서 확인 후, 현재 단일 `_CapturePrepLeaf`를 stepper로 분할할지 결정 필요.

### 노드 매핑 — *정정* (2026-04-26 실제 확인)

`get_design_context` 로 노드를 직접 조회한 결과 원래 인계 매핑이 잘못된 곳이 있었음:

| 프레임 | nodeId | **실제** 내용 | 매핑되는 cubit phase |
|---|---|---|---|
| ID Gen_03_02_01 | `301:6519` | **ID 타입 picker** (주민등록증/운전면허증/여권/기타 2x2 그리드) | `IdGenStage.selectIdType` (`_IdTypeLeaf`) |
| ID Gen_03_02_01_01 | `301:6833` | (미확인 — 추정: 카드 들어옴) | `captureFront` 변형 |
| ID Gen_03_02_01_02 | `301:9642` | **카메라 + 어두운 오버레이 + 가이드 박스** | `IdGenStage.captureFront` (`_CaptureFrontLeaf` → `IdCameraCapture`) |
| ID Gen_03_02_01_03 | `301:25075` | (미확인) | 미정 |
| ID Gen_03_02_01_04 | `301:25205` | (미확인) | 미정 |

### `captureBack` — 뒷면 촬영 2 프레임

| 프레임 | nodeId | 추정 |
|---|---|---|
| ID Gen_03_02_02 | `301:6697` | 뒷면 가이드 |
| ID Gen_03_02_02_01 | `301:9740` | 뒷면 캡처 |

### `ocrConfirm` — OCR 결과 2 프레임

| 프레임 | nodeId | 추정 |
|---|---|---|
| ID Gen_03_02_03 | `301:6741` | OCR 진행 중 / 인식 결과 |
| ID Gen_03_02_03_01 | `301:9828` | 결과 편집 |

## 적용 결과 (2026-04-26)

### 1. `_IdTypeLeaf` (선택 picker, 노드 `301:6519`)

**전 (vertical radio list):**
```text
┌─ 신분증 종류 ────────┐
○ 주민등록증
○ 가족 증명
○ 태권도 단증
                [다음]
```

**후 (Figma 2x2 그리드):**
```text
┌─ 신분증 스캔을 위한 ─┐
│  촬영 방법을 선택해 │
│        주세요       │
│ ┌────────┬────────┐ │
│ │주민등록 │운전면허│ │
│ │  (선택) │        │ │
│ ├────────┼────────┤ │
│ │  여권   │  기타   │ │
│ └────────┴────────┘ │
│                     │
│       [다음]        │
```

변경 사항:
- 28px Pretendard Bold 헤딩 (line-height 1.08, letter-spacing -0.56) 추가
- 2-column GridView, 160:100 비율, 8px gap
- 셀: 20px radius, 13/8 padding, 18px Bold 라벨
- 선택: brand orange 배경 + 흰색 텍스트 / 비선택: 흰색 배경 + `#1A1A1A` 텍스트
- 라벨 정렬 center

**시맨틱 차이 (의도적):**

Figma `301:6519` 의 4 옵션은 *스캔 소스*(ID 종류) 를 묻는 picker. mobile cubit 의 `IdGenType` 은 *발급할 카드 종류*(selfId / cardFamily / cardTaekwondo). 의미가 다름. 현재는 그리드 *레이아웃 패턴* 만 차용해서 mobile 의 3 enum 값을 표시. 향후 "기타" 옵션이나 "스캔 소스" 분기가 필요하면:
- `IdGenType` 에 `.other` 추가 → 4개 셀 채움, 또는
- 별도 `IdGenStage.selectScanSource` phase 추가 후 `selectIdType` 와 분리

### 2. `IdCameraCapture` (카메라, 노드 `301:9642`)

**Figma 정합성 변경:**

| 항목 | 전 | 후 (Figma 매칭) |
|------|----|----|
| 카드 가이드 비율 | 1.585 (CR80 / ID-1 표준) | **1.5046** (Figma 측정값 328:218) |
| 가이드 너비 | `size.width * 0.85` | `(328 / 360) * size.width` (디자인 고정 비례) |
| 가이드 radius | 16 | 8 (Figma 의 직사각형 마스크에 가까움) |
| 테두리 두께 | 3 | 1 (Figma `border-[#ffa000]` = 1px) |
| 코너 액센트 너비 | 4 | 3 (스케일 적용으로 디바이스별 자동 조정) |
| 안내 텍스트 | 상단 pill 1개 | **상단 single line + 하단 2-line** |
| 상단 안내 스타일 | 까만 pill, 흰 13px Body | 16px Pretendard Medium, 흰색, line-height 1.3, letter-spacing -0.24 (Figma 노드 `301:5516` 직접 매칭) |
| 하단 안내 | 없음 | 신규 — `chon_id_gen_capture_tip` ARB 키 ("어두운 배경에서 촬영해주세요. / 빛이 반사되지 않도록 방향을 조정해 주세요.") |
| dim 색상 | `0x99000000` (~60%) | `0x99000000` (Figma `rgba(0,0,0,0.6)` 정확 매칭, 변경 없음) |

**ARB 키 추가:** `chon_id_gen_capture_tip` 6 로케일 (ko/en/ja/vi/zh_CN/zh_TW). 카메라 하단 2-line 안내 문구.

### 3. 잔여 작업 (다음 세션 후보) — 2026-04-26 일부 정정

원래 인계에 7개 노드가 미처리로 적혀있었으나, 실제 노드 데이터를 받아본 결과 4개는 새 화면이 아니었음:

| 노드 | 원래 추정 | 실제 내용 | 처리 |
|------|----------|----------|------|
| `301:6833` (`ID Gen_03_02_01_01`) | 카드 정렬 중 | **OS 카메라 권한 다이얼로그** (Chon에서 사진 촬영 허용) | Flutter `permission_handler` 가 네이티브로 처리 — 작업 불필요 ✅ |
| `301:9740` (`ID Gen_03_02_02_01`) | 뒷면 카메라 | 같은 OS 권한 다이얼로그 (뒷면 캡처 시점) | 동일 — 작업 불필요 ✅ |
| `301:9828` (`ID Gen_03_02_03_01`) | OCR 편집 | 같은 OS 권한 다이얼로그 (OCR 시점) | 동일 — 작업 불필요 ✅ |
| `301:6697` (`ID Gen_03_02_02`) | 뒷면 가이드 | **운전면허증 선택 상태**의 picker (`301:6519` 의 selection variant) | `_IdTypeLeaf` 가 자동 처리 ✅ |
| `301:6741` (`ID Gen_03_02_03`) | OCR 진행중 | **여권 선택 상태**의 picker | 동일 ✅ |
| `301:25075` (`ID Gen_03_02_01_03`) | 미리보기 | **OCR 확인 form** (편집 가능, 5 필드 prefilled) | ✅ 적용 완료 (아래) |
| `301:25205` (`ID Gen_03_02_01_04`) | 확인 버튼 | **추가 정보 form** (5 + 전화번호) | ✅ 적용 완료 (아래) |

진짜 작업이 필요했던 건 2개. 모두 이번 세션에 처리.

### 4. `_OcrConfirmLeaf` (Figma `301:25075`) — 적용 완료 (2026-04-26)

**전 (read-only display):** `_Row(label: '이름', value: state.fullName)` 형태로 5개 필드를 라벨/값 페어로 보여주고 [재촬영] / [확인] 두 버튼만 제공.

**후 (Figma form):**
- `Stateful` 위젯 — 5개 `TextEditingController` (성명/주민번호/주소/발행처/발행일) 로컬 보유
- 28px Pretendard Bold 2-line 타이틀: "ID 생성에 입력할 / 개인정보를 입력해주세요"
- 16px subtitle 인라인 강조: "스캔 내용이 틀린부분은 [수정](#EF700F) 해주세요"
- 흰 카드 (radius 20, padding 20) 안에:
  - 98×116 portrait placeholder (#F5F5F5 fill, #D9D9D9 1px border, 10 radius) — TODO: OCR face crop 으로 교체
  - 신규 `_FigmaFormField` 위젯 5개 (input_Y 스타일: #F5F5F5 fill, #D9D9D9 1.5px border, 12 radius, 12/16 padding, 16px Pretendard Medium)
- [재촬영] (outlined) → `cubit.goTo(captureFront)` / [다음] (primary) → 컨트롤러 값 flush + `cubit.next()`

### 5. `_ReviewLeaf` (Figma `301:25205`) — 적용 완료 (2026-04-26)

**전:** OCR 결과 3개 필드만 read-only 로 다시 보여주는 확인 화면.

**후:**
- `Stateful` 위젯 — 5개 + 1개 (전화번호) 컨트롤러
- 28px Pretendard Bold 타이틀: "ID 생성에 입력할 / 추가 정보를 입력해주세요"
- 흰 카드 + 동일한 `_FigmaFormField` 5개 (input_Y 스타일)
- **6번째 필드: 전화번호** — `_FigmaFormField` 의 `filled: false` 변형 (input_N — 흰 배경, "아직 비어있음" 의미)
- [발급하기] primary CTA — `cubit.submit()`

⚠️ **전화번호는 cubit state 에 영구 저장 안 됨** — `IdGenerationState` 가 freezed 라 새 필드 추가 시 `id_generation_cubit.freezed.dart` 의 77 references 를 수동 수정하거나 `flutter pub run build_runner build` 를 돌려야 함. 이번 세션에 freezed 자동화 환경 부재로 widget-local controller 로 처리. 다음 세션에 build_runner 가능하면:

1. `IdGenerationState` 에 `@Default('') String phoneNumber` 추가
2. `IdGenerationCubit.onPersonalInfoChanged` 시그니처에 `String? phoneNumber` 추가
3. `IdGenerationCubit.submit` 에서 `CreateCardRequest(... , phoneNumber: state.phoneNumber)` 전달
4. `CreateCardRequest` model 에 phoneNumber 필드 추가 (backend 와 협의 필요)

해당 부분에 코드 주석 `TODO(phone): ...` 표기됨.

### 6. ARB 키 추가 (6 로케일)

| 키 | 용도 |
|-----|-----|
| `chon_id_gen_field_phone` | 전화번호 입력 라벨 |
| `chon_id_gen_ocr_form_title` | OCR 확인 form 헤딩 (2-line) |
| `chon_id_gen_ocr_form_subtitle_prefix` | "스캔 내용이 틀린부분은 " |
| `chon_id_gen_ocr_form_subtitle_edit` | "수정" (#EF700F 강조) |
| `chon_id_gen_ocr_form_subtitle_suffix` | " 해주세요" |
| `chon_id_gen_review_form_title` | Review form 헤딩 |

`l10n.dart` + `messages_*.dart` 6개 모두 동기화 (build_runner 미실행 환경 대응).

골든 테스트 추가 권장 (다음 세션):

```dart
// test/golden/id_camera_capture_golden_test.dart
testWidgets('camera guide overlay 픽셀 매칭', (tester) async {
  // CameraController mock 후 _GuideOverlay 단독 렌더
  await tester.pumpWidget(...);
  await expectLater(find.byType(_GuideOverlay), matchesGoldenFile('goldens/id_camera_guide.png'));
});
```

## 다음 세션 진행 단계

### 1. Figma 데스크톱에서 노드 선택 (가장 중요)

```
1. Figma 데스크톱 앱에서 CHON 1.1 파일 열기
2. 좌측 Layers 패널에서 Section 3 영역으로 스크롤
3. capture phase 첫 노드부터 선택 (ID Gen_03_02_01 = 301:6519)
4. 채팅으로: "node 301:6519 (ID Gen_03_02_01)을 Flutter 코드로 변환해줘"
```

> 노드 선택 안 하면 `get_design_context` MCP 툴이 "nothing selected" 에러를 냅니다.

### 2. reference 코드를 받으면

`get_design_context` 결과로 reference Flutter 스니펫과 스크린샷을 받습니다. 이를 다음과 같이 정리:

1. `id_camera_capture.dart`의 `_GuidePainter`를 Figma 스타일에 맞춰 조정
   - 카드 비율 (현재 1.585) — Figma 측정값으로 교체
   - 코너 액센트 길이 (현재 24)
   - 테두리 색 / 두께
   - 다크 오버레이 투명도 (현재 0x99000000)

2. `_InstructionPill` 위치 / 스타일
   - 현재: 화면 상단 24px 떨어진 곳에 까만 pill
   - Figma: 헤더 영역 안일 가능성

3. `_ShutterButton`
   - 현재: 80×80 흰 테두리 + 60×60 brand 원
   - Figma 셔터: 더 큰 / 다른 형태?

4. 캡처 후 미리보기 화면 (`_PreviewLeaf`) — 현재 없음
   - `captureFront` 다음에 셔터 후 *결과 미리보기*가 별도 phase로 들어가야 할 수 있음
   - cubit에 `IdGenStage.previewFront` / `previewBack` 추가 검토

### 3. 후처리 체크리스트

자동 변환된 reference 코드에서 다음을 손봅니다:

- [ ] raw `Color(0xFFffffff)` → `ChonColors.textInverse` 등 토큰화
- [ ] raw `TextStyle(fontFamily: 'Pretendard'...)` → `ChonTextStyles.body()` 등
- [ ] `flutter_screenutil` `.sp` / `.r` / `.h` / `.w` 적용
- [ ] BuildContext 의존성 점검
- [ ] 카메라 lifecycle (initState / dispose)이 reference 코드에 빠져있으면 추가
- [ ] 권한 거부 분기 처리 (현재 `id_camera_capture.dart`에 있음)

### 4. 새 phase 추가가 필요할 경우

현재 cubit:
```
start → personalInfo → verificationOk → selectIdType
  → capturePrep → captureFront → captureBack → ocrConfirm → review → done
```

Figma 의도와 비교 후 phase 분할이 필요하면:
- `capturePrep` → `prep1, prep2, ..., prep6` (6 단계)
- `captureFront` → `frontGuide, frontAligning, frontCaptured, frontReview` (4 단계)
- `captureBack` → `backGuide, backCaptured`
- `ocrConfirm` → `ocrRunning, ocrResult, ocrEdit`

**또는 더 좋은 패턴**: `captureFront`/`captureBack`을 inner state machine으로 두고 (`CaptureSubStage` enum), 외부 phase는 그대로 유지. 코드가 깔끔.

### 5. 카메라 동작 확인

실제 디바이스 / 에뮬레이터에서:

1. **권한 다이얼로그가 뜨는지** — Android: `CAMERA` permission, iOS: `NSCameraUsageDescription` in Info.plist
2. **카메라 미리보기가 나오는지** — 검은 화면이면 `availableCameras()` 결과 확인
3. **셔터 후 파일이 생성되는지** — `XFile.path`로 임시 파일 경로 받음
4. **base64 변환 + OCR 호출** — `OCR_SECRET` 환경변수가 `.env`에 있어야 함 (없으면 OCR 스킵)

### 6. 골든 테스트 권장

카메라 phase는 widget test로는 검증 불가 (카메라 hardware 의존). 골든 테스트 또는 integration test로:

```dart
// test/golden/id_camera_capture_golden_test.dart
testWidgets('camera guide overlay matches design', (tester) async {
  // CameraController는 mock
  // _GuideOverlay만 단독 렌더링하여 골든 비교
  await tester.pumpWidget(...);
  await expectLater(
    find.byType(GuideOverlay),
    matchesGoldenFile('goldens/id_camera_guide.png'),
  );
});
```

골든 이미지를 Figma export와 픽셀 단위 비교하면 정합성 자동 검증.

## 빠른 시작 메시지 (다음 세션)

```
"Figma 데스크톱에서 node 301:6519 (ID Gen_03_02_01) 선택했어. 
이걸로 시작."
```

선택 후 reference 코드 받아서 `id_camera_capture.dart` 정밀화 + capture sub-stage 분할 결정 → 약 30~60분 작업.

## 관련 파일

- [`mobile/lib/presentations/modules/id_generation_v2/widgets/id_camera_capture.dart`](../../mobile/lib/presentations/modules/id_generation_v2/widgets/id_camera_capture.dart) — 현재 구현
- [`mobile/lib/presentations/modules/id_generation_v2/cubit/id_generation_cubit.dart`](../../mobile/lib/presentations/modules/id_generation_v2/cubit/id_generation_cubit.dart) — phase 머신
- [`mobile/lib/presentations/modules/id_generation_v2/id_generation_v2_page.dart`](../../mobile/lib/presentations/modules/id_generation_v2/id_generation_v2_page.dart) — phase별 leaf 렌더링
- [`docs/figma/codegen_workflow.md`](./codegen_workflow.md) — 일반 변환 워크플로
