# i18n 마이그레이션 — v2 페이지의 다국어화

## 현재 상태

CHON 모바일은 **6개 로케일**을 지원합니다 (en / ko / vi / ja / zh_CN / zh_TW). ARB 파일은 `mobile/lib/l10n/intl_<locale>.arb`에 있고 `intl_utils`로 `S` 클래스(`mobile/lib/generated/l10n.dart`)가 자동 생성됩니다.

**문제:** 이번 세션에 추가한 v2 페이지들은 **한국어 텍스트가 하드코딩** 되어 있어 다른 5개 로케일에서는 모두 한국어로 표시됩니다.

**스캔 결과:** 14개 파일 × 약 139개 한국어 문자열.

## 이번 세션에서 처리한 것

### ARB 파일 — 29개 키 추가 (6 로케일 × 29 = 174 항목)

[`mobile/lib/l10n/intl_*.arb`](../../mobile/lib/l10n) 6개 파일 모두 동일하게 다음 키 추가:

| 그룹 | 키 |
|------|-----|
| 공통 액션 | `chon_action_next` / `_skip` / `_start` / `_confirm` / `_retry` / `_save` / `_send` (7) |
| Tutorial 4 step | `chon_tutorial_s1_title` / `_s1_body` … `_s4_body` (8) |
| Home 배너/카드 | `chon_home_banner` / `_tutorial_card` / `_mutual_title` / `_mutual_subtitle` / `_input_label` (5) |
| Home Quick Action | `chon_home_q_contact` / `_edit_profile` / `_qr` / `_support` (4) |
| Bottom Nav | `chon_nav_home` / `_chon` / `_id_card` / `_mutual` / `_family_tree` (5) |

총 **29개 키**.

### Home v2 페이지 — 4개 문자열 교체 (예시)

[`home_page_v2.dart`](../../mobile/lib/presentations/modules/home/home_page_v2.dart):

```dart
// before
'상호인증으로 CHON ID를 만들어보세요.'

// after
S.current.chon_home_banner
```

4개 위치 모두 `S.current.xxx`로 교체. import에 `package:base_flutter/generated/l10n.dart` 추가.

## ⚠️ 적용하기 전에 한 단계

`S.current.chon_home_banner` 같은 새 getter는 ARB 추가만으로는 안 생깁니다. **`intl_utils` 코드 생성**이 한 번 돌아야 합니다:

```powershell
cd "C:\I. Program\Workspace_\DID\mobile"
dart run intl_utils:generate
```

이 명령은 `mobile/lib/generated/l10n.dart`를 갱신해서 새 ARB 키들을 `S` 클래스의 getter로 노출합니다. **이거 안 돌리면 `home_page_v2.dart`가 컴파일 안 됩니다** (`The getter 'chon_home_banner' isn't defined`).

`build_runner`와 별도 명령이지만 첫 빌드 흐름에 같이 넣으세요:

```powershell
flutter pub get
dart run build_runner build --delete-conflicting-outputs
dart run intl_utils:generate            # ← 이번 세션 추가분 때문에 필요
```

## 남은 작업 — 미적용 파일 (한국어 하드코딩 유지)

다음 페이지/파일들은 아직 한국어 하드코딩 상태입니다. 다음 세션에서 같은 패턴으로 마이그레이션:

| 파일 | 추정 문자열 수 | 우선순위 |
|------|-------------|--------|
| `tutorial_page.dart` | ~12 | 🔴 높음 (사용자 첫 진입) |
| `mutual_auth_request_page.dart` | ~15 | 🟡 중간 |
| `mutual_auth_request_cubit.dart` (errorMessage) | 2 | 🟡 |
| `mutual_auth_receive_page.dart` | ~10 | 🟡 |
| `mutual_auth_offline/*.dart` | ~12 | 🟡 |
| `family_tree_v2_page.dart` | ~3 | 🟢 |
| `inproc_contact_page.dart` | ~10 | 🟢 |
| `profile_edit_v2_page.dart` | ~8 | 🟡 |
| `report_v2_page.dart` | ~15 | 🟡 |
| `ai_chat_v2_page.dart` | ~6 | 🟡 |
| `id_generation_v2_page.dart` | ~25 | 🔴 높음 (큰 화면 + 가장 많은 폼) |
| `id_camera_capture.dart` | ~3 | 🟢 |
| `id_generation_cubit.dart` (errorMessage) | 3 | 🟡 |
| `chon_quick_action_button.dart` (helper labels) | 4 | 🟡 |

총 **약 130개 문자열** 더 남음.

## 마이그레이션 패턴 — Tutorial을 예로

`tutorial_page.dart`는 `static const defaultSteps`에 한국어가 하드코딩되어 있어 살짝 까다로움 (S.current는 const 컨텍스트에서 안 됨). 다음 패턴으로:

```dart
// 1. import 추가
import 'package:base_flutter/generated/l10n.dart';

// 2. const → static method
class TutorialPage extends StatefulWidget {
  // ❌ before
  // static const List<TutorialStep> defaultSteps = [
  //   TutorialStep(title: '나를 확인 받는...', ...),
  //   ...
  // ];

  // ✅ after
  static List<TutorialStep> defaultStepsLocalized() => [
    TutorialStep(
      title: S.current.chon_tutorial_s1_title,
      body: S.current.chon_tutorial_s1_body,
      illustration: TutorialIllustration.shield,
    ),
    TutorialStep(
      title: S.current.chon_tutorial_s2_title,
      body: S.current.chon_tutorial_s2_body,
      illustration: TutorialIllustration.handshake,
    ),
    // ...
  ];

  // 3. 디폴트 파라미터에서 호출:
  // const TutorialPage({super.key, this.steps, ...});  // const 유지 안 됨
  TutorialPage({
    super.key,
    List<TutorialStep>? steps,
    this.onFinish,
    this.onSkip,
  }) : steps = steps ?? defaultStepsLocalized();
}
```

`const` 생성자가 깨지지만, 이 페이지는 어차피 instance마다 PageController를 만들어서 const 효익이 적음. OK.

## 매스 마이그레이션 스크립트 (참고)

bash + sed로 일괄 치환은 실수 위험이 큼. 권장:

1. **VS Code의 "찾기/바꾸기 - 정규식"** 사용
   - 패턴: `'([ㄱ-힝]+[^']*)'` (한글로 시작하는 문자열)
   - 매칭 후 한 줄씩 ARB 키로 교체
2. **`dart fix --apply`** 끝에 한 번 — import 정리 + lint
3. **`dart run intl_utils:generate`** 매번 새 키 추가 후

## 키 네이밍 컨벤션

기존 ARB는 `snake_case`이고 일부는 `SCREAMING_CASE`. 새 키는 `chon_<area>_<purpose>`로 통일했습니다:

- `chon_action_*` — 공통 CTA 버튼
- `chon_home_*` — Home 페이지 전용
- `chon_tutorial_*` — Tutorial 단계
- `chon_nav_*` — Bottom Navigation
- `chon_<feature>_*` — 모듈별 (e.g. `chon_mutual_auth_req_*`)

이 규칙대로 추가하면 grep으로 v2 키만 골라 보기 편합니다.

## 테스트 영향

`S.current.xxx`를 쓰는 위젯 테스트는 **MaterialApp에 `localizationsDelegates`/`supportedLocales`** 설정이 필요합니다. 안 그러면 `LocalizationsDelegate` 누락 에러:

```dart
Widget _harness(Widget child) {
  return MaterialApp(
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    home: child,
  );
}
```

이번 세션에 작성한 widget 테스트들 (home_page_v2_test 외)은 아직 plain `MaterialApp(home: child)`만 씁니다. `S.current` 안 쓰는 테스트는 그대로 통과하지만, Home v2 위젯 테스트는 이 보강이 필요합니다.

## 다음 세션 첫 명령

```powershell
cd "C:\I. Program\Workspace_\DID\mobile"
flutter pub get
dart run build_runner build --delete-conflicting-outputs
dart run intl_utils:generate
flutter test test/presentations/modules/home/home_page_v2_test.dart -r expanded
```

마지막 명령으로 현재 Home 위젯 테스트가 `S` 갱신 후에도 통과하는지 검증. 통과하면 위 표의 페이지들을 같은 패턴으로 일괄 마이그레이션.
