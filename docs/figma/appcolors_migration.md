# AppColors → ChonColors 마이그레이션 계획

CHON 모바일에는 두 개의 색상 토큰 시스템이 공존합니다:

- **`AppColors`** (`mobile/lib/core/theme/app_colors.dart`) — 벤더가 만든 레거시 시스템. 44개 파일에서 사용 중.
- **`ChonColors`** (`mobile/lib/core/theme/chon_design_tokens.dart`) — Figma CHON 1.1 디자인에서 추출한 정식 토큰. 새 v2 모듈에서 사용.

이 문서는 두 시스템을 단계적으로 통합하는 계획입니다. **한 번에 다 바꾸지 마세요** — 44개 파일을 동시에 건드리면 회귀 위험이 큽니다.

## 매핑 표

`AppColors` 필드 → `ChonColors` 동등값.

| AppColors | 현재 값 | ChonColors | Figma 매핑 | 노트 |
|-----------|---------|------------|-----------|------|
| `background` | `#FFFDF7` | `bgPage` `#F5F5F5` | ✅ | 페이지 배경. 약간 톤이 달라 시각적 차이 있음 — 디자이너 확인 권장 |
| `white` | `#FFFFFF` | `bgSurface` `#FFFFFF` | ✅ | 동일 |
| `black` | `Colors.black` | `textPrimary` `#1E1E1E` | ⚠️ | Figma는 순흑(`#000`)이 아닌 `#1E1E1E` 사용. 텍스트는 textPrimary로, 진짜 검정이 필요한 곳만 `Colors.black` 유지 |
| `primary` | `#FFA000` | `brandPrimary` `#FFA000` | ✅ | 동일 |
| `primaryText` | `#FFA000` | `textPrimary` `#1E1E1E` | ❌ | **벤더 placeholder 오류** — 본문 텍스트가 brand 오렌지로 잡혀있었음. textPrimary로 교체 권장 |
| `secondaryText` | `#4B5563` | `textSecondary` `#5A5A5A` | ⚠️ | 미세하게 다름. Figma 따라 5A5A5A로 통일 권장 |
| `greyText` | `#9E9E9E` | `textTertiary` `#8E8E93` | ⚠️ | 미세 차이. 통일 권장 |
| `inputBackground` | `#F5F5F5` | `bgPage` `#F5F5F5` | ✅ | 동일 |
| `darkOrange` | `#DF861F` | `brandAccent` `#FF9500` | ⚠️ | Figma 액센트는 더 밝음 |
| `whiteText` | `#FFFFFF` | `textInverse` `#FFFFFF` | ✅ | 동일 |
| `blackText` | `#374151` | `textPrimary` `#1E1E1E` | ⚠️ | 다른 값. Figma 따라 1E1E1E로 |
| `lightYellow` | `#FFF2CA` | (없음) | ⚠️ | 카드 강조 배경에 사용. 새 디자인에서는 `#FFE7B8` 같은 색을 일러스트 배경에 사용 — 명시 토큰화 필요 |
| `darkYellow` | `#FFD740` | (없음) | ⚠️ | 일부 강조 버튼. brandPrimary로 통일 검토 |
| `red` | `#F84646` | (없음) | 🟡 | 에러 색. ChonColors에 추가 권장 (`semanticDanger: #E24B4A` 같은 이름) |
| `green` | `Colors.green` | (없음) | 🟡 | 성공 색. ChonColors에 추가 권장 (`semanticSuccess: #1D9E75`) |
| `darkBlue` | `#2563EB` | (없음) | ❌ | 사용처 미상. 제거 후보 |

> ✅ = 그대로 매핑 가능 / ⚠️ = 값이 살짝 다름, 통일 권장 / ❌ = 벤더 placeholder, 정리 필요 / 🟡 = ChonColors에 의미 토큰 추가 권장

## 마이그레이션 전략 (4 단계)

### Phase 1 — 호환성 shim (안전, 즉시)

`AppColors`에 ChonColors 매핑 getter를 추가해서 *기존 코드가 새 토큰값을 받게* 합니다. 깨질 거 없음:

```dart
// app_colors.dart
extension AppColorsChonAlias on AppColors {
  /// Use [ChonColors.bgPage] for new code.
  Color get chonBgPage => const Color(0xFFF5F5F5);
  Color get chonBgSurface => const Color(0xFFFFFFFF);
  Color get chonBrandPrimary => const Color(0xFFFFA000);
  Color get chonTextPrimary => const Color(0xFF1E1E1E);
  Color get chonTextSecondary => const Color(0xFF5A5A5A);
  Color get chonTextTertiary => const Color(0xFF8E8E93);
  Color get chonTextInverse => const Color(0xFFFFFFFF);
}
```

→ 새 위젯이 점진적으로 `colors.chonBgPage` → 더 나아가 `ChonColors.bgPage`로 전환.

### Phase 2 — Deprecation 표시

가장 잘못된 placeholder 필드부터 `@Deprecated` 표시:

```dart
@Deprecated('Use ChonColors.textPrimary (#1E1E1E) — primaryText was a vendor placeholder set to the brand orange by mistake.')
final Color primaryText;
```

→ 분석기가 사용처마다 경고. 새 코드에서 못 쓰게 되고 기존 코드는 점진 정리.

### Phase 3 — 화면 단위 점진 교체

PR 단위로 한 모듈씩 마이그레이션. 각 PR이 작아서 회귀 추적 쉬움:

1. `home_page.dart` (legacy) — Phase 0에서 v2로 교체 완료, AppColors 의존성 없음
2. `splash_page.dart` (legacy) — 이번 세션에 이미 `Assets.icons.logo`만 의존. 토큰 무관
3. `login_page.dart` — AppColors 사용 중. 색상만 ChonColors로 교체
4. ... (모듈별 1 PR씩)

### Phase 4 — AppColors 클래스 자체 제거

마지막 `AppColors` 사용처가 사라지면:

- `app_colors.dart` 삭제
- `app_theme.dart`의 `BaseThemes`에서 `AppColors` 의존성 제거 → `ChonColors` 직접 사용
- `context.colors` extension 폐기 (`context.theme`만 유지)

## 자동화 도움 명령어

### 사용처 빠르게 찾기

```powershell
cd "C:\I. Program\Workspace_\DID\mobile"
# AppColors 사용 파일 목록
Select-String -Path lib\**\*.dart -Pattern "context\.colors\.|AppColors\." -List | Select-Object Path

# 특정 필드만 사용처
Select-String -Path lib\**\*.dart -Pattern "colors\.primaryText" | Select-Object Path, LineNumber
```

### bash 환경 (WSL / Linux)

```bash
# AppColors 사용 파일
grep -rl "context\.colors\.\|AppColors\." mobile/lib

# 필드별 카운트
grep -roh "colors\.\w\+" mobile/lib/presentations | sort | uniq -c | sort -rn | head -20
```

## 권장 실행 순서

1. **이번 세션은 Phase 1까지** — `app_colors.dart`에 `chonBgPage` 같은 alias 추가. 기존 동작 100% 유지하면서 새 코드가 깨끗하게 진입
2. **다음 세션부터** Phase 2 deprecation
3. **그 다음 세션**부터 모듈별 Phase 3 마이그레이션 (1주일에 1~2 모듈 권장)
4. **Phase 4 (2026-04-26 완료)** — `@Deprecated` 4개 텍스트 필드(`blackText` / `primaryText` / `secondaryText` / `greyText`) 사용처 0건 도달 후 필드 자체를 삭제. `AppColors.light()` 팩토리에서도 제거. analyzer 경고가 사라지고 파레트가 한 단계 더 깨끗해짐.

### Phase 4 — 완료 기록 (2026-04-26)

| 변경 | 위치 |
|------|------|
| `color.secondaryText` (12회) → `color.chonTextSecondary` | `mobile/lib/core/theme/app_theme.dart` |
| `color.blackText` → `color.chonTextPrimary` | `mobile/lib/core/theme/app_theme.dart:123` |
| `colors.secondaryText` (2회) → `colors.chonTextSecondary` | `mobile/lib/presentations/modules/check_in_out/check_in_out_page.dart` |
| 4개 deprecated 필드 + 생성자 매개변수 + 팩토리 값 삭제 | `mobile/lib/core/theme/app_colors.dart` |

→ 외부 사용처 0건 확인(`grep -rn "\\.\\(blackText\\|primaryText\\|secondaryText\\|greyText\\)\\b" mobile/lib`) 후 제거. legacy 화면들도 이제 textSecondary/Primary/Tertiary가 *Figma 값*(#5A5A5A, #1E1E1E, #8E8E93)으로 렌더됨 — 벤더 값(#4B5563, #374151, #9E9E9E)에서 미세하게 시프트하지만 디자인 정합성 회복.

남은 deprecated 마커 후보(다음 Phase 5에서 정리할 만한 것):
- ~~`AppColorsChonAlias` extension 자체를 점진 제거하고 직접 `ChonColors.X` import으로 통일~~ ✅ Phase 5 완료
- legacy 화면들 색상 전반(`bg/page` `#FFFDF7` vs Figma `#F5F5F5` 톤 차이) 정렬

### Phase 5 — 완료 기록 (2026-04-26)

`AppColorsChonAlias` extension (14 alias getter) 의 실제 사용처는 2개 파일 13곳 뿐이었음:
- `app_theme.dart` — `color.chonTextSecondary` (12회) + `color.chonTextPrimary` (1회)
- `check_in_out_page.dart` — `colors.chonTextSecondary` (1회 — Phase 4에서 이미 통합 후 1곳)

| 변경 | 위치 |
|------|------|
| `color.chonTextSecondary` (12) → `ChonColors.textSecondary` | `mobile/lib/core/theme/app_theme.dart` |
| `color.chonTextPrimary` (1) → `ChonColors.textPrimary` | `mobile/lib/core/theme/app_theme.dart` |
| `colors.chonTextSecondary` (1) → `ChonColors.textSecondary` | `mobile/lib/presentations/modules/check_in_out/check_in_out_page.dart` |
| `import 'chon_design_tokens.dart'` 추가 | `mobile/lib/core/theme/app_theme.dart` |
| `AppColorsChonAlias` extension 전체 (14 getter) 삭제 | `mobile/lib/core/theme/app_colors.dart` |

→ 검증 (`grep -rn "chonBgPage\|chonBgSurface\|chonBrandPrimary\|...\|AppColorsChonAlias" mobile/lib`): 잔여 사용처 0건. 코멘트만 남음.

이제 모든 화면이 `import 'package:base_flutter/core/theme/chon_design_tokens.dart'` 한 줄로 canonical 토큰을 직접 사용. `AppColors` 자체는 여전히 살아있지만(non-text 토큰 — primary/border/grey 등) 텍스트 색상 영역에서는 ChonColors 가 단일 진실 원천(SSOT).

## 각 v2 페이지 토큰 적용 현황 (이미 완료)

| 모듈 | ChonColors 적용 |
|------|----------------|
| home_page_v2 | ✅ |
| splash_page_v2 | ✅ |
| tutorial_page | ✅ |
| mutual_auth_request_page | ✅ |
| mutual_auth_receive_page | ✅ |
| mutual_auth_offline_* | ✅ |
| family_tree_v2 | ✅ |
| inproc_contact_page | ✅ |
| profile_edit_v2_page | ✅ |
| report_v2_page | ✅ |
| ai_chat_v2_page | ✅ |
| id_generation_v2_page + camera | ✅ |

→ 새 코드는 모두 ChonColors 기반. 마이그레이션 대상은 *legacy 화면들* 뿐.
