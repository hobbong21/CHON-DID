# Mobile Tests

Test suite for the CHON Flutter app. Grows alongside each feature that's
moved from the legacy implementation onto the Figma-faithful design.

## Layout

```
test/
├── presentations/
│   ├── modules/
│   │   ├── home/
│   │   │   ├── home_cubit_test.dart                   # HomeCubit unit (bloc_test)
│   │   │   └── home_page_v2_test.dart                 # Home v2 widget
│   │   ├── splash/
│   │   │   └── splash_page_v2_test.dart               # Splash v2 widget
│   │   ├── tutorial/
│   │   │   └── tutorial_page_test.dart                # Tutorial widget
│   │   ├── mutual_auth_request/
│   │   │   └── mutual_auth_request_cubit_test.dart    # Cubit unit
│   │   └── family_tree_v2/
│   │       └── family_tree_node_test.dart             # Tree builder unit
│   └── widgets/
│       ├── chon_bottom_navigation_bar_test.dart
│       └── chon_quick_action_button_test.dart
└── README.md (this file)
```

## Before you run

The Mutual Auth Cubit uses Freezed for state. You must run code generation
once after pulling new Cubits:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

If you skip this, you'll see compile errors like
`The name '_$MutualAuthRequestState' isn't a class.` — that's the missing
generated file.

## Dependencies (added to `pubspec.yaml`)

- `bloc_test: ^10.0.0` — declarative cubit test helpers
- `mocktail: ^1.0.4` — mock without code generation

If you haven't yet:

```bash
flutter pub get
```

## Running tests

```bash
# All tests
flutter test

# Just the new ones
flutter test test/presentations/widgets/
flutter test test/presentations/modules/home/

# A single file with verbose output
flutter test test/presentations/modules/home/home_cubit_test.dart -r expanded

# Coverage
flutter test --coverage
# then open coverage/lcov.info or run lcov genhtml for HTML
```

## What's covered

### `home_cubit_test.dart`

`HomeCubit.loadData()` state transitions:

- No access token → emits empty list, skips remote calls.
- Token + empty cards → loading → empty success.
- Token + cards with phone → loading → cards → loading → relations (only `unVerified` items kept).
- Repository throws → loading → error state with cleared cards.

`HomeCubit.changeIdIndex()` updates `idIndex` synchronously.

GetIt singletons (`SelfIdRepo`, `RelationRepo`, `AppCubit`) are unregistered/reregistered per test so the cubit picks up the mocks.

### `chon_quick_action_button_test.dart`

- Renders label and icon, fires `onTap` once.
- Spec size 76×76 within `flutter_screenutil` design size.
- Semantics label collapses newlines for screen readers.
- Custom `semanticLabel` overrides the visible label.
- `ChonQuickActionGrid` renders/hides the section label based on `label` param.
- Asserts when more than 4 actions are passed.
- All four `ChonQuickActions` helpers (contact / editProfile / qrCode / support) render their canonical labels.

### `chon_bottom_navigation_bar_test.dart`

- All five labels render (`홈`, `CHON`, `신분증`, `상호인증`, `가계도`).
- `iconBuilder` receives the correct `isSelected` flag per tab.
- Tapping a tab fires `onTap` with the right enum.
- The center `idCard` slot renders with `ChonColors.brandPrimary` background.
- `ChonNavLabels` override replaces the default Korean labels.

### `home_page_v2_test.dart`

Widget tests for the Figma-faithful Home page:

- Banner, two cards, quick actions, and bottom nav all render.
- Notification badge hidden when `requesterList` is empty.
- Notification count shown when `requesterList` is non-empty.
- `loadData` is invoked once on initial build.
- Tapping a quick action does not throw (full nav not exercised — see *Known limitations*).
- Default selected tab is `ChonNavTab.home`.

The page is supplied a stub `HomeCubit` via the new `cubit` constructor parameter so tests don't hit any I/O.

## Known limitations

- **Navigation isn't exercised end-to-end.** `AppNavigator.push` ultimately calls `context.push` from go_router, which requires a `GoRouter` mounted above the widget. The widget tests verify that taps don't throw and that the right callback wiring exists, but full route stacking would need a router-aware harness (probably `MaterialApp.router` + a stub `GoRouter` with the relevant routes mocked or no-op).
- **Loader overlay** is wrapped via `GlobalLoaderOverlay` so `context.loaderOverlay` works inside the page.
- **Pretendard font** loads from `assets/fonts/PretendardVariable.ttf`; if you add golden tests later, ensure the font is loaded with `loadFontFromList` or Flutter's `fontLoader` test helper before the first golden capture.

## Adding more tests

Common patterns:

```dart
// 1) Cubit test with mocked repos
blocTest<HomeCubit, HomeState>(
  'description',
  build: () { /* configure mocktail stubs */; return HomeCubit(); },
  act: (c) => c.someMethod(),
  expect: () => [/* sequence of state matchers */],
  verify: (_) { verify(() => ...).called(1); },
);

// 2) Widget test with stubbed cubit
testWidgets('description', (tester) async {
  final cubit = _StubHomeCubit(HomeState(/* seeded values */));
  await tester.pumpWidget(_harness(HomePageV2(cubit: cubit)));
  // assertions
});
```
