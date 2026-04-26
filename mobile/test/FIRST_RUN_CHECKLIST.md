# `flutter test` 첫 실행 체크리스트

이 세션에서 새로 추가된 코드가 처음으로 `flutter test`를 통과하기까지 마주칠 가능성이 높은 이슈와 수정 패턴 모음. 샌드박스에 `flutter`/`dart`가 없어서 정적 분석만 가능했기 때문에, 이 문서는 *예측*입니다 — 실제 출력으로 확인 후 패치하시면 됩니다.

## 0. 사전 준비 (반드시)

```powershell
cd "C:\I. Program\Workspace_\DID\mobile"
flutter pub get
dart run build_runner build --delete-conflicting-outputs
dart run intl_utils:generate
```

`build_runner` 실행이 가장 중요합니다. 이번 세션에 추가된 Freezed cubit 파일이 7개입니다:

- `mutual_auth_request_cubit.freezed.dart`
- `mutual_auth_receive_cubit.freezed.dart`
- `mutual_auth_offline_cubit.freezed.dart`
- `family_tree_cubit.freezed.dart`
- `inproc_contact_cubit.freezed.dart`
- `report_v2_cubit.freezed.dart`
- `id_generation_cubit.freezed.dart`

이 파일들이 생성되기 전에는 `_$XxxState` 같은 심볼이 없어서 컴파일 에러가 납니다.

## 1. 예측 가능한 1차 컴파일 에러

### A. `Routes` enum 정합성

`routes.dart`를 heredoc으로 다시 쓰면서 v2 라우트들을 추가했습니다. 만약 어디선가 `Routes.detailReportPage`처럼 *기존* enum 항목을 쓰고 있는데 누락됐다면 못 찾는 에러:

```
Error: The getter 'detailReportPage' isn't defined for the type 'Routes'.
```

→ 누락된 항목을 `routes.dart`에 다시 추가. 현재 정의된 항목 목록은 파일 하단 참고.

### B. 헤리덕 후 import 경로 변경

`app_navigator.dart`가 import 경로를 `../presentations/modules/...` → `package:base_flutter/presentations/modules/...`로 통일했습니다. 다른 파일이 `import '../../...'` 같은 상대 경로를 쓰고 있어도 둘 다 동작하지만, 같은 파일에 양쪽 형태가 혼재하면 lint 경고는 날 수 있습니다.

### C. `IdGenerationCubit` 생성자 변경

이전: `IdGenerationCubit({required selfIdRepo})`
현재: `IdGenerationCubit({required selfIdRepo, required ocrRepo})`

→ 호출하는 모든 위치(라우터 + 테스트)는 이미 업데이트했지만, 누락된 위치 발견 시 추가:

```dart
IdGenerationCubit(
  selfIdRepo: Injector.getIt<SelfIdRepo>(),
  ocrRepo: Injector.getIt<OcrRepo>(),
)
```

### D. `KoreanIdCard?` import 누락

`SelfIdCreaterPage(card: s.extra as KoreanIdCard?)`에서 `KoreanIdCard`를 사용. 이미 `resolve_korean_data.dart` import 했지만 lint warning 가능. 빌드에는 영향 없음.

### E. `_FakeAppCubit`의 `noSuchMethod` 시그니처

`home_cubit_test.dart`의 `_FakeAppCubit`은 다음 시그니처:

```dart
class _FakeAppCubit extends Cubit<AppState> implements AppCubit {
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
```

`AppCubit`이 추가 필드 / 메서드를 가질 경우 noSuchMethod를 통해 처리되지만, 일부 분석기는 `bool needRefreshHome` 같은 직접 필드는 직접 선언해야 함. 이미 `bool needRefreshHome = false;`로 선언했으므로 OK.

### F. Freezed `@Default(null)` 

freezed 3.x에서 `@Default(null) Type? field` 패턴이 일부 버전에서 경고를 냅니다. `Type? field` (annotation 없이)로도 충분 — 둘 다 동작. 굳이 깔끔하게 하려면 `@Default` 없이:

```dart
RelationUserModel? target,
```

## 2. 위젯 테스트 단골 실패

### A. `flutter_screenutil` 미초기화

`ScreenUtilInit`으로 감싸지 않으면 `.sp` / `.r` 호출 시 `LateInitializationError`. 모든 widget test는 `_harness()`에서 ScreenUtilInit으로 감싸야 함. 이미 그렇게 작성했지만 새로 추가하시는 테스트도 동일 패턴 사용.

### B. `MaterialApp.router` vs `MaterialApp`

위젯 테스트에서는 일반 `MaterialApp(home: ...)`만 써도 충분 — go_router 기능을 안 쓰는 테스트라면. 단 `AppNavigator.push` 호출이 들어가면 `Navigator is not initialized` 에러. 그 경우 콜백을 stub으로 바꿔서 우회 (이번 세션 페이지들은 대부분 `onCallback` 패턴이라 OK).

### C. `loader_overlay` 미초기화

`context.loaderOverlay.show()` 호출하는 페이지는 `GlobalLoaderOverlay`로 감싸야 함. `home_page_v2_test.dart`에서 이미 적용.

### D. Pretendard 폰트 경고

`Cannot load font 'Pretendard'` 같은 경고는 폰트 자산이 테스트 환경에서 로드 안 돼서 나오는데 *경고일 뿐 테스트 실패는 아님*. 로그가 시끄러우면 테스트 시작 전:

```dart
TestWidgetsFlutterBinding.ensureInitialized();
```

### E. `MobileScannerController` / `CameraController` 인스턴스 

`mutual_auth_offline_scan_page_test.dart`는 만들지 않았습니다. 이유:

- `mobile_scanner` 위젯은 실 카메라가 없는 테스트 환경에서 초기화 실패
- 마찬가지로 `id_camera_capture.dart`의 `CameraController`도 평가 환경에서 실패
- 이런 widget은 골든 또는 integration test로 다루는 게 일반적

대신 화면을 mock으로 감싸서 cubit 행동만 테스트하는 패턴이 안전.

## 3. 회귀 분류와 수정 우선순위

| 클래스 | 영향 | 1순위 패턴 |
|---|---|---|
| Compile 에러 (`*.freezed.dart` missing) | 🔴 모든 cubit 테스트가 컴파일 안 됨 | `dart run build_runner build` |
| Compile 에러 (import 누락 / 시그니처 불일치) | 🔴 빌드 안 됨 | 메시지대로 import 추가 / 시그니처 맞추기 |
| 위젯 테스트 실패 (Pretendard / ScreenUtil) | 🟡 일부 테스트만 빨강 | harness wrapper 점검 |
| 위젯 테스트 실패 (BlocProvider 누락) | 🟡 단일 페이지 빨강 | `BlocProvider.value(value: cubit, child: ...)` 추가 |
| 카메라/스캐너 테스트 | 🟡 widget 테스트로는 실행 불가 | 골든/integration로 분리 |

## 4. `flutter test` 명령어 옵션

```powershell
# 전체
flutter test

# 한 파일만
flutter test test/presentations/modules/home/home_cubit_test.dart

# 한 그룹만 (-r expanded는 자세한 출력)
flutter test test/presentations/modules/home/ -r expanded

# 실패 한 개에서 멈추기
flutter test --bail

# 커버리지
flutter test --coverage
# coverage/lcov.info 가 생성됨
```

## 5. 첫 실행 결과를 알려주시면

다음 세션 시작 시 `flutter test` 출력을 그대로 붙여주시면 한 번에 패치 작성합니다. 가장 흔한 패턴:

- `Type 'X' is not a subtype of type 'Y'` → mock의 `registerFallbackValue` 추가
- `LateInitializationError: ScreenUtil` → harness에 `ScreenUtilInit` 추가
- `Bad state: No element` → mock 응답 누락, `when(...).thenAnswer((_) async => ...)` 추가
- `_$IdGenerationState is undefined` → `dart run build_runner build` 안 돈 상태

## 6. 정의된 Routes 목록 (참고)

```
splash, tutorial, login, register,
home, setting, vehicleList, profile, profileEdit, chat,
selfIdCreaterOption, selfIdOcrOption, selfIdCreater, selfIdCreaterSuccess,
selfIdList, selfIdListChoose,
requestVerification, verificationCross, verificationFinish,
familyList, familyTree,
qrScan, qrScanSuccess, checkInOut,
bankList, bankCreate, bankCreateSuccess, terms,
ocrId, imageView, biography, confirmRelationship, contactPicker,
reportPage, detailReportPage, termService, privacyPolicy, guardPage, requesterListPage,
mutualAuthRequest, mutualAuthReceive, mutualAuthOffline,
mutualAuthOfflineDisplay, mutualAuthOfflineScan,
inProcContact, profileEditV2, reportV2, aiChatV2, idGenerationV2
```
