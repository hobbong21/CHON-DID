# Firebase Crashlytics Integration Plan

End-to-end plan for adding Firebase Crashlytics (crash + non-fatal error reporting) and Firebase Analytics (basic usage events) to the CHON mobile app. Currently the app has **no Firebase SDK at runtime** — Firebase is only used for App Distribution (CI artifact delivery), which does not require any in-app code.

## Why now

- Dev and stg builds are landing on tester devices via App Distribution. When they crash, we currently have no way to know unless the tester screen-records and reports.
- Prod-bound AAB is about to start shipping to Google Play internal testing. Shipping a prod release with no crash visibility is irresponsible.
- Crashlytics is free, lightweight (~300 KB), and integrates with the same `chon-app` Firebase project we're already using.

## Scope

### In scope
- `firebase_core` + `firebase_crashlytics` + `firebase_analytics` Flutter plugins
- Per-flavor `google-services.json` configuration (dev, stg, prod)
- Automatic crash reporting for native and Flutter uncaught errors
- Manual `recordError()` hooks for Dio network failures and other caught exceptions
- Symbol/dSYM upload in CI for readable stack traces
- Opt-out mechanism for local/IDE development

### Out of scope (for now)
- Firebase Performance Monitoring (can be added later; more expensive at scale)
- Firebase Remote Config (separate initiative tied to feature flags)
- Firebase Cloud Messaging (separate initiative tied to push notifications)
- iOS Crashlytics (requires Apple Developer account — see [APPLE_DEVELOPER_SETUP.md](./APPLE_DEVELOPER_SETUP.md))

---

## Phase 1 — Register Android apps in Firebase (additional flavors)

The `dev` and `stg` Android apps are **already registered** in Firebase project `chon-app` (used for App Distribution). Confirm their `google-services.json` downloads are available:

| Flavor | Package | Firebase App ID | Status |
|---|---|---|---|
| dev | `com.chondid.app.dev` | `1:563439155287:android:1e6505c89c34af931b0b12` | ✅ Registered |
| stg | `com.chondid.app.stg` | `1:563439155287:android:53c9b503895fac411b0b12` | ✅ Registered |
| prod | `com.chondid.app` | _(pending)_ | ⏳ Register before first prod release |

To register the prod app:

1. Firebase Console → `chon-app` → **Add app → Android**
2. Package name: `com.chondid.app`
3. App nickname: `CHON SelfID (prod)`
4. SHA-1 / SHA-256: **skip for now** — required only for Google Sign-In and phone auth, not Crashlytics
5. Download the generated `google-services.json` — but **do not commit it** (see Phase 2)

---

## Phase 2 — Wire per-flavor `google-services.json`

Flutter's `google-services` Gradle plugin reads `android/app/google-services.json`, which only supports one app ID at a time. Two standard approaches:

### Option A — per-flavor directories (recommended)

Place a separate file per flavor in its own source set:

```
android/app/src/dev/google-services.json
android/app/src/stg/google-services.json
android/app/src/prod/google-services.json
```

Gradle automatically picks the right one based on the active flavor. **This is cleaner and matches our existing flavor setup.**

### Option B — single file with multiple apps (simpler but noisier)

Download the combined `google-services.json` from Firebase Console → Project Settings (it includes all registered apps in one file) and place it at `android/app/google-services.json`. Firebase Gradle plugin picks the matching block by package name.

**Decision**: Use **Option A** for clarity. Each flavor's `google-services.json` is small (~2 KB) and tracks cleanly in git.

### Secret handling

`google-services.json` contains the Firebase API key, but those keys are **not secrets** for mobile apps — they're baked into the APK and visible in any decompile. Firebase security rules + App Check are the actual access controls. Committing them is accepted practice.

However, to keep the repo tidy and avoid leaking stg/prod config to open-source forks, store them as GitHub secrets and write them at build time:

```yaml
- name: Materialize google-services.json (dev)
  run: |
    mkdir -p android/app/src/dev
    echo "${{ secrets.GOOGLE_SERVICES_JSON_DEV_BASE64 }}" | base64 --decode \
      > android/app/src/dev/google-services.json
```

Add 3 GitHub secrets: `GOOGLE_SERVICES_JSON_DEV_BASE64`, `_STG_BASE64`, `_PROD_BASE64`.

---

## Phase 3 — Add Firebase plugins to pubspec

```yaml
dependencies:
  firebase_core: ^3.6.0
  firebase_crashlytics: ^4.1.3
  firebase_analytics: ^11.3.3
```

Pin major versions because these plugins release often and can break `Gradle` / `AGP` alignment.

Then:

```bash
flutter pub get
cd ios && pod install && cd ..   # once iOS is active
```

---

## Phase 4 — Update Android Gradle configuration

### android/build.gradle (root)

```gradle
plugins {
  // ... existing ...
  id 'com.google.gms.google-services' version '4.4.2' apply false
  id 'com.google.firebase.crashlytics' version '3.0.2' apply false
}
```

### android/app/build.gradle

```gradle
plugins {
  // ... existing ...
  id 'com.google.gms.google-services'
  id 'com.google.firebase.crashlytics'
}
```

The Crashlytics Gradle plugin automatically uploads ProGuard/R8 mapping files on release builds — no extra CI config needed.

---

## Phase 5 — Initialize Firebase and hook error handlers

Edit `lib/main.dart` (or wherever `runApp` is called) **before** any app code runs:

```dart
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart'; // generated by flutterfire configure

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Disable Crashlytics for local/debug so devs don't pollute prod data.
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(!kDebugMode);

    // Pass all uncaught "fatal" Flutter framework errors to Crashlytics.
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    // Pass all uncaught platform/async errors to Crashlytics.
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    // Tag every crash with flavor + build info so we can filter in the console.
    await FirebaseCrashlytics.instance.setCustomKey('flavor', F.name);
    if (F.buildNumber.isNotEmpty) {
      await FirebaseCrashlytics.instance
          .setCustomKey('build_number', F.buildNumber);
    }
    if (F.buildShaShort.isNotEmpty) {
      await FirebaseCrashlytics.instance
          .setCustomKey('build_sha', F.buildShaShort);
    }

    runApp(const MyApp());
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
}
```

Generate `firebase_options.dart` with:

```bash
dart pub global activate flutterfire_cli
flutterfire configure --project=chon-app
```

Run this once per flavor (or just once with all bundle IDs selected) — it creates the Dart-level Firebase options file.

---

## Phase 6 — Report caught exceptions

Anywhere we catch but don't re-throw (Dio interceptors, isolate boundaries, deliberate `try`/`catch` around integrations):

```dart
try {
  await _doRiskyThing();
} catch (e, s) {
  await FirebaseCrashlytics.instance.recordError(
    e, s,
    reason: 'risky thing failed',
    fatal: false,
  );
  // swallow + show friendly UI
}
```

Suggested first targets to instrument:
- `lib/data/api/*` Dio interceptor error handler
- OpenAI chatbot stream parsing
- Naver OCR response deserialization
- `login_cubit` / auth flow (high-value signal if login breaks)

---

## Phase 7 — Tie user identity to crashes (optional but useful)

When a user logs in, call:

```dart
await FirebaseCrashlytics.instance.setUserIdentifier(user.id);
```

Use the DID or internal user ID — **never** raw PII (email, phone, name). On logout:

```dart
await FirebaseCrashlytics.instance.setUserIdentifier('');
```

This lets us search "show me all crashes for user X" when a tester reports a repro.

---

## Phase 8 — CI changes

The Crashlytics Gradle plugin uploads mapping files automatically on `./gradlew assembleRelease` and `bundleRelease`, so **no workflow changes are required** for Android crash symbolication.

However, we should:

1. Add the 3 `GOOGLE_SERVICES_JSON_*_BASE64` secrets (Phase 2)
2. Add `Materialize google-services.json` steps to each build job, matching the flavor
3. Verify in the Firebase Console that the mapping file uploaded by checking a new release's "Mapping file" field

---

## Phase 9 — Verify end-to-end

1. Add a temporary crash trigger somewhere dev-visible:

   ```dart
   ElevatedButton(
     onPressed: () => FirebaseCrashlytics.instance.crash(),
     child: const Text('Test Crash'),
   )
   ```

2. Build and install the dev APK on a tester phone
3. Tap the button → app force-closes
4. Reopen the app → on next launch, Crashlytics uploads the crash
5. Firebase Console → Crashlytics → should see the event within ~5 minutes
6. Confirm the stack trace is readable (class/line names, not `a.b.c`)
7. Confirm custom keys `flavor`, `build_number`, `build_sha` appear on the crash detail page
8. Remove the test button

---

## Phase 10 — Privacy and compliance checklist

- [ ] Add Crashlytics + Analytics to the app's privacy policy (data collection disclosure)
- [ ] Declare in Play Console **Data safety** form: "Crash logs — collected, not shared, for app functionality"
- [ ] Declare in App Store Connect: "Diagnostics — linked to user ID if logged in, not used for tracking"
- [ ] For Korean users, confirm this data collection complies with PIPA (개인정보보호법) — crash dumps don't contain PII if we strictly avoid `setUserIdentifier(email)` etc.
- [ ] Consider exposing a "Send crash reports" toggle in Settings for users who want to opt out

---

## Troubleshooting

### "Cannot find symbol: com.google.firebase.crashlytics"
Gradle sync hasn't picked up the new plugins. Run `./gradlew --refresh-dependencies clean` inside `android/`.

### "Missing google-services.json"
Flavor directory doesn't match the Gradle product flavor name. Directory must be exactly `android/app/src/<flavor>/google-services.json`.

### Crashes show obfuscated stack traces in console
Mapping file didn't upload. Check the Gradle build log for a line like `Uploading Crashlytics mapping file for variant prodRelease` — if absent, the Crashlytics plugin isn't applied to release builds.

### Analytics events not showing up
Analytics has a **24 hour delay** before events appear in the standard dashboard. Use DebugView (Firebase Console → Analytics → DebugView) with a debug-enabled build to see events in real time.

### "This app is not registered" error
The `google-services.json` doesn't contain a block for the current package name. Re-download from Firebase Console after adding the prod app.

---

## Rough effort estimate

| Phase | Effort |
|---|---|
| 1 — Register prod Android app | 10 min |
| 2 — google-services.json wiring | 30 min |
| 3 — Add plugins to pubspec | 5 min |
| 4 — Gradle changes | 15 min |
| 5 — Initialize + error handlers | 45 min |
| 6 — Wire into Dio + auth catches | 1 hour |
| 7 — User identity tie-in | 15 min |
| 8 — CI `Materialize google-services.json` steps | 30 min |
| 9 — Verification | 30 min |
| 10 — Privacy disclosures | 20 min |

**Total**: ~4 hours focused work, spread over a dev cycle.
