# ID Gen 카메라 phase 픽셀 정밀화 인계 가이드

현재 상태: ID Generation v2의 카메라 캡처 phase는 **기능적으로 완성**되어 있습니다 (`mobile/lib/presentations/modules/id_generation_v2/widgets/id_camera_capture.dart`). 카메라 미리보기 + 카드 모양 가이드 오버레이 + 셔터 버튼 + 권한 처리가 동작합니다. 다만 Figma의 *픽셀 정밀 디자인*과 비교한 정합성 검토는 아직 안 됐습니다.

이 문서는 다음 세션에서 디자인 정합성을 맞출 때 이어가는 가이드입니다.

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

### `captureFront` — 앞면 촬영 5 프레임

| 프레임 | nodeId | 추정 |
|---|---|---|
| ID Gen_03_02_01 | `301:6519` | 가이드 + 빈 카메라 |
| ID Gen_03_02_01_01 | `301:6833` | 카드 들어옴 (정렬 중) |
| ID Gen_03_02_01_02 | `301:9642` | 카드 정렬 완료 (셔터 활성) |
| ID Gen_03_02_01_03 | `301:25075` | 셔터 후 / 미리보기 |
| ID Gen_03_02_01_04 | `301:25205` | 확인 버튼 |

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
