# CHON Common Widgets

이 폴더에는 CHON 1.1 디자인을 옮기면서 화면 여러 개에서 재사용되는 위젯이 들어있습니다. **새로 화면을 만들 때는 raw `Color()` / `TextStyle(...)`을 쓰지 말고 여기 있는 컴포넌트와 `core/theme/chon_design_tokens.dart`를 쓰세요.**

## 새 위젯

| 위젯 | 파일 | 출처 (Figma) |
|------|------|-------------|
| `ChonBottomNavigationBar` | `chon_bottom_navigation_bar.dart` | `Navigation Bar_*` 인스턴스 5종 (`348:19580` 외) |
| `ChonQuickActionButton` / `ChonQuickActionGrid` | `chon_quick_action_button.dart` | Home `Frame 177677` (`602:45713`) |

## 디자인 토큰

`core/theme/chon_design_tokens.dart` 사용:

```dart
import 'package:base_flutter/core/theme/chon_design_tokens.dart';

Container(
  color: ChonColors.bgPage,                     // #f5f5f5
  child: Text('상호 인증', style: ChonTextStyles.cardTitle()),  // Pretendard Bold 22px
);
```

| 카테고리 | 사용 |
|----------|------|
| 색상 | `ChonColors.bgPage`, `bgSurface`, `bgOverlay`, `brandPrimary`, `textPrimary`, `textSecondary`, `textTertiary`, `textInverse`, `iconStrong`... |
| 타이포 | `ChonTextStyles.cardTitle()`, `actionLabel()`, `sectionLabel()`, `body(size: 16)`, `navLabel()` |
| 셰이프/스페이싱 | `ChonShape.radiusCard` (20), `radiusPill` (50), `pagePaddingX` (16), `bottomNavHeight` (68), `quickActionItem` (76×76) |

기존 `AppColors` / `app_theme.dart`는 벤더 placeholder 값이 섞여있어서 새 코드에는 가급적 쓰지 마세요. 기존 화면을 건드리는 게 아니면.

## 사용 예시

### Home 화면 — Bottom Nav + Quick Actions

```dart
import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/presentations/widgets/chon_bottom_navigation_bar.dart';
import 'package:base_flutter/presentations/widgets/chon_quick_action_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ChonNavTab _selectedTab = ChonNavTab.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChonColors.bgPage,
      body: SafeArea(
        child: Column(
          children: [
            // ... header / banner / cards ...
            const Spacer(),
            ChonQuickActionGrid(
              label: '입력 정보',
              actions: [
                ChonQuickActions.contact(
                  icon: const Icon(Icons.call_outlined, color: ChonColors.textPrimary),
                  onTap: () => /* navigate */ {},
                ),
                ChonQuickActions.editProfile(
                  icon: const Icon(Icons.person_outline, color: ChonColors.textPrimary),
                  onTap: () => {},
                ),
                ChonQuickActions.qrCode(
                  icon: const Icon(Icons.qr_code, color: ChonColors.textPrimary),
                  onTap: () => {},
                ),
                ChonQuickActions.support(
                  icon: const Icon(Icons.help_outline, color: ChonColors.textPrimary),
                  onTap: () => {},
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: ChonBottomNavigationBar(
        selected: _selectedTab,
        onTap: (tab) => setState(() => _selectedTab = tab),
        iconBuilder: (tab, isSelected) {
          // 구체 아이콘은 호출 측에서 주입. SVG든 Icon이든 자유.
          final color = tab == ChonNavTab.idCard
              ? ChonColors.textInverse
              : (isSelected ? ChonColors.textSecondary : ChonColors.iconDisabledStrong);
          switch (tab) {
            case ChonNavTab.home:
              return Icon(Icons.home_outlined, color: color, size: 22);
            case ChonNavTab.chon:
              return Icon(Icons.bubble_chart_outlined, color: color, size: 22);
            case ChonNavTab.idCard:
              return Icon(Icons.badge_outlined, color: color, size: 22);
            case ChonNavTab.mutualAuth:
              return Icon(Icons.shield_outlined, color: color, size: 22);
            case ChonNavTab.familyTree:
              return Icon(Icons.account_tree_outlined, color: color, size: 22);
          }
        },
      ),
    );
  }
}
```

### 다국어 지원

`ChonBottomNavigationBar`의 `labels` 파라미터에 `S.of(context)` 결과를 주입:

```dart
ChonBottomNavigationBar(
  labels: ChonNavLabels(
    home: S.of(context).navHome,
    chon: 'CHON',
    idCard: S.of(context).navIdCard,
    mutualAuth: S.of(context).navMutualAuth,
    familyTree: S.of(context).navFamilyTree,
  ),
  // ... 나머지 동일
);
```

## 후속 작업 (선택)

- `assets/icons/`에 Figma의 실제 아이콘 SVG export 후 `iconBuilder`에서 `SvgPicture.asset` 사용
- 알림 배지(unread dot)는 위젯 내부에서 처리하지 않으므로, 필요하면 `iconBuilder`에서 `Stack`으로 직접 처리
- `AppColors`를 정리해서 `ChonColors`만 남길지(벤더 정리 작업) 결정 — 영향 큼, PR 단위로 분리 권장
