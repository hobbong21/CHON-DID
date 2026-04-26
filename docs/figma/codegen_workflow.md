# Figma → Flutter 자동 변환 워크플로

CHON 디자인의 특정 화면을 Flutter 코드로 자동 변환할 때 쓰는 절차입니다. 핵심 도구는 Figma MCP의 `get_design_context`이고, 결과물은 항상 *참조 코드 (reference code)* 라고 생각하셔야 합니다 — 그대로 붙여넣을 수 있는 컴포넌트가 아니라 레이아웃·색상·텍스트가 보존된 Flutter 스니펫이어서, 디자인 토큰(`ChonColors`, `ChonTextStyles`)과 공통 위젯(`ChonBottomNavigationBar`, `ChonQuickActionButton`)으로 갈아끼우는 후처리가 필요합니다.

## 사전 준비 (1회)

1. **Figma 데스크톱 앱 설치 + 로그인** — https://www.figma.com/downloads/
   - MCP 서버는 *데스크톱 앱*과만 통신합니다. 브라우저(figma.com)에서만 열려있으면 `get_design_context` / `get_variable_defs` / `get_metadata`가 모두 "nothing selected" 에러를 냅니다.
   - 로그인 계정은 `hobbong21@gmail.com` (현재 MCP에 인증된 계정).
2. **CHON 1.1 파일을 데스크톱 앱에서 한 번 열어두기** — 파일키 `X44QW3oVr3BWkyW08m9zow`
3. **모바일 레포에 토큰/공통 위젯 추가** — 이미 완료:
   - `mobile/lib/core/theme/chon_design_tokens.dart`
   - `mobile/lib/presentations/widgets/chon_bottom_navigation_bar.dart`
   - `mobile/lib/presentations/widgets/chon_quick_action_button.dart`

## 화면 단위 변환 절차

### 1) Figma에서 노드 선택

[`docs/figma/index.md`](./index.md)에서 변환할 화면의 nodeId를 찾습니다. 예) Home은 `473:27963`.

Figma 데스크톱 앱에서:

- 좌측 **Layers 패널**에서 해당 프레임 이름을 클릭 (예: `Home`, `MutualAuthReq_01`)
- 또는 캔버스에서 프레임 외곽선을 클릭
- **선택이 1개여야 합니다** — 여러 개 선택되어 있으면 에러

선택된 프레임은 우측 패널에 단독으로 표시되고, 캔버스에서 파란 외곽선이 잡힙니다.

### 2) 채팅으로 변환 요청

저(Claude)에게 이렇게 부탁하시면 됩니다:

> "node 473:27963 (Home)을 Flutter 코드로 변환해줘"

또는 URL을 그대로:

> "https://www.figma.com/design/X44QW3oVr3BWkyW08m9zow/CHON-1.1?node-id=473-27963 변환"

저는 다음 순서로 처리합니다:

1. `get_design_context(fileKey, nodeId, clientFrameworks=flutter, clientLanguages=dart)` 호출 → reference Flutter 스니펫과 스크린샷 회수
2. `get_variable_defs(...)` → 이 노드에서 쓴 컬러/타이포 변수가 있으면 토큰으로 매핑
3. 결과를 `mobile/lib/presentations/modules/<module>/<screen>_page.dart` 형태로 정리. 이때:
   - raw `Color(0xFFffa000)` → `ChonColors.brandPrimary`로 치환
   - raw `TextStyle(fontFamily: 'Pretendard', ...)` → `ChonTextStyles.cardTitle()` 등으로 치환
   - 바텀 네비/Quick Action처럼 이미 추출한 공통 위젯이 등장하면 인라인 코드를 지우고 `ChonBottomNavigationBar(...)` / `ChonQuickActionGrid(...)`로 교체

### 3) 후처리 체크리스트

자동 생성된 코드는 거의 항상 다음을 손봐야 합니다:

| 항목 | 이유 / 처리 |
|------|------------|
| `flutter_screenutil` 적용 | 자동 생성은 raw `double`을 씁니다. `.sp` / `.r` / `.h` / `.w`로 감쌀 것 |
| 라우팅 / `go_router` 연결 | `onPressed` 핸들러는 빈 람다로 옵니다. `AppNavigator.push(Routes.xxx)` 호출 추가 |
| 다국어 (l10n) | 한국어 하드코딩이 옵니다. `S.of(context).xxx`로 교체 (en/ko/vi/ja/zh_CN/zh_TW 6개) |
| Image 컴포넌트 | Figma는 `IMAGE` fill로 표현. `assets/images/...png`로 export 후 `Image.asset` 또는 `SvgPicture.asset` 교체 |
| 비즈니스 로직 (BLoC) | `cubit.state.xxx`를 `BlocBuilder`로 wrap. `home_cubit.dart`에 정의된 state shape에 맞춰 매핑 |
| 색상 정확성 검증 | 자동 변환은 종종 `#5a5a5a`를 `Colors.grey`로 치환합니다. 토큰으로 통일 (`ChonColors.textSecondary`) |

### 4) 검증

- `flutter analyze` (벤더 코드 lint는 비차단이지만 새 파일은 깨끗하게)
- `flutter run --flavor dev --dart-define=APP_FLAVOR=local`로 실제 화면 비교
- `mobile/docs/`에 화면별 비교 스크린샷(피그마 vs 실제) 저장 권장

## 자주 마주치는 에러

### `You currently have nothing selected`

Figma 데스크톱이 백그라운드로 가있거나 선택이 풀린 상태. 데스크톱을 포커스한 뒤 레이어 한 개를 다시 클릭하세요. 클릭 직후 곧바로 채팅 메시지를 보내야 합니다 — Figma 창을 떠나서 다른 앱을 만지면 선택이 풀립니다.

### `Tool call timed out`

`get_metadata`가 큰 페이지(125개 프레임 같은)에서 자주 발생. 특정 프레임 nodeId로 좁혀서 호출하세요. 또는 `use_figma`로 Plugin API 코드를 직접 실행 — 더 빠르고 timeout 안 납니다 (`figma.getNodeByIdAsync(...)`).

### Reference 코드가 너무 큼 / 응답 잘림

`forceCode: true` 옵션을 줘도 응답이 잘리면, 화면을 더 작은 단위로 쪼개서(예: header만, body만) 호출. 또는 `get_screenshot`만 받고 메타데이터로 직접 빌드.

### Plugin API 응답에 truncated가 보임

`use_figma`의 응답은 20KB 제한입니다. `maxDepth`를 줄이거나 `children.length`만 카운트하도록 요약 함수를 손보세요. 위 home_spec.md를 만들 때 `maxDepth: 5`, 텍스트는 `characters` 1줄만 추출하는 식으로 압축했습니다.

## 추천 변환 순서

이미 토큰과 공통 위젯이 깔려있으니, 효과 큰 것부터:

1. **Home (`473:27963`)** — 이미 분석 완료. `home_spec.md` 참고. 가장 토큰/위젯 활용도가 높음
2. **Splash (`754:12524`)** — 단일 화면, 단순. 워밍업용으로 적합
3. **Tutorial 4-step (`320:18658` ~ `347:4285`)** — 캐러셀 패턴
4. **MutualAuth 송/수신 6+8 화면** — 폼 + 상태 화면, BLoC 패턴 학습에 좋음
5. **ID Generation 시리즈** — 카메라 / 폼 / 결과 화면. 가장 복잡하고 화면 수도 많음
6. **AI Chat 12 화면** — 채팅 UI 패턴
7. **Family Tree** — 트리 그리는 부분만 별도 (Custom painter 검토)
8. **Edit profile / Report** — 폼 일색

각 단계에서 사용할 수 있는 명령:

```
"node <id> (<screen name>)을 Flutter 코드로 변환해줘"
"node <id> 스크린샷만 다시 보여줘"
"node <id>의 색상/타이포 변수 추출"
```
