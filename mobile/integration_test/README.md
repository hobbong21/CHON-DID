# Integration Tests

Integration tests run a real Flutter app on a device or emulator. They're
slower than unit/widget tests but exercise the full stack: real router,
real Cubits, real (or stubbed) repos.

## Setup

`integration_test` package is already added to `pubspec.yaml` under
`dev_dependencies`. After pulling new code:

```powershell
flutter pub get
```

## Running

### Headless (host VM, no real device)

```powershell
flutter test integration_test/smoke_test.dart
```

This runs in the `flutter_test` headless mode — same as widget tests, but
with the integration_test binding active.

### On a real device / emulator

```powershell
# List devices
flutter devices

# Run on a specific device
flutter test integration_test/smoke_test.dart -d <device_id>
```

For Android: connect a phone with USB debugging or boot an emulator.
For iOS: open Simulator first or connect a physical iPhone with `xcrun
xctrace list devices`.

## What's covered

`smoke_test.dart` — minimal sanity:
1. Splash v2 boots and the auto-redirect timer fires
2. Tutorial renders with explicit steps, Skip + Next visible
3. `ChonColors` design tokens are reachable

## Adding more

For each major v2 flow, add a separate `*_flow_test.dart`:

- `mutual_auth_request_flow_test.dart` — search → confirm → send
- `id_generation_flow_test.dart` — start → personalInfo → review → done
- `report_flow_test.dart` — list → compose → submit → success

Use real Cubits but mock repositories via mocktail so the test doesn't
touch network. Wire the test cubit into the router via `MaterialApp.router`
+ a stub `RoutingConfig` if you want to drive `AppNavigator.push` calls.
