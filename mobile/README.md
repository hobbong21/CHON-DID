# CHON Mobile

Flutter mobile application for the CHON DID family tree platform.

## Stack

- Flutter 3.29.3 (managed via FVM)
- Dart SDK ^3.6.0
- BLoC / Cubit for state management
- Dio + Retrofit for networking
- go_router for navigation
- flutter_dotenv for environment config
- 6 languages: en, ko, vi, ja, zh_CN, zh_TW

## CI/CD

GitHub Actions pipeline (`.github/workflows/mobile-ci.yml`):

```
Push to dev  → Analyze → Build signed Android APK (dev) → Firebase App Distribution (internal-testers)
Push to stg  → Analyze → Build signed Android APK (stg) → Firebase App Distribution (stg-testers)
Push to main → Analyze → Build signed Android AAB (prod) → Google Play internal track (draft)
             → Analyze → Build iOS dev (no signing — TestFlight ready, disabled)
PR to any    → Analyze only
```

Every build is stamped with `github.run_number` as the Android `versionCode` and both the commit SHA and run number are injected via `--dart-define` (exposed as `F.buildSha`, `F.buildShaShort`, `F.buildNumber` in `lib/flavors.dart`) so any About/Debug screen can display build provenance.

### Android — Dev (`push` to `dev`)
- Builds signed APK using keystore from `KEYSTORE_BASE64` secret
- Uploads to **Firebase App Distribution** (`chon-app` project, app `com.chondid.app.dev`)
- Notifies the `internal-testers` group via email
- APK also retained as GitHub Actions artifact (14 days)

### Android — Staging (`push` to `stg`)
- Builds signed APK for the `stg` flavor
- Uploads to **Firebase App Distribution** (app `com.chondid.app.stg`)
- Notifies the `stg-testers` group
- APK retained as artifact (14 days)

### Android — Prod (`push` to `main`)
- Builds signed AAB (app bundle) for the `prod` flavor
- Uploads to **Google Play internal testing track** as **draft** (manual promotion to review)
- AAB retained as artifact (30 days)
- Requires completed Play Console developer verification (identity, website, phone)

### iOS
- Dev-flavor build only, no code signing — TestFlight upload steps are scaffolded in the workflow and commented out until the Apple Developer account is purchased
- Known issue: iOS bundle IDs in `ios/Runner.xcodeproj` still reflect vendor placeholders (`com.abdulkarim.chondev`, `com.chon.poc`) and must be aligned to `com.chondid.app[.dev|.stg]` before first TestFlight submission

### Required GitHub Secrets

| Secret | Purpose |
|---|---|
| `KEYSTORE_BASE64` | Base64-encoded `chon-release.jks` |
| `KEYSTORE_PASSWORD` | Keystore password |
| `KEY_PASSWORD` | Signing key password |
| `KEY_ALIAS` | Signing key alias |
| `FIREBASE_APP_ID_DEV` | Firebase Android app ID for the `dev` flavor |
| `FIREBASE_APP_ID_STG` | Firebase Android app ID for the `stg` flavor |
| `FIREBASE_TOKEN` | Firebase CLI refresh token (from `firebase login:ci`) |
| `GOOGLE_PLAY_SERVICE_ACCOUNT` | *(pending)* Play Developer API service account JSON |
| `APP_STORE_CONNECT_KEY_ID` | *(pending)* App Store Connect API key ID |
| `APP_STORE_CONNECT_ISSUER_ID` | *(pending)* App Store Connect issuer ID |
| `APP_STORE_CONNECT_API_KEY_BASE64` | *(pending)* Base64-encoded App Store Connect API `.p8` key |
| `IOS_CERTIFICATE_BASE64` | *(pending)* Base64-encoded iOS signing `.p12` |
| `IOS_CERTIFICATE_PASSWORD` | *(pending)* `.p12` password |
| `IOS_PROVISIONING_PROFILE_BASE64` | *(pending)* Base64-encoded `.mobileprovision` |

Format and lint checks are non-blocking until vendor code is cleaned up.

## Flavors

| Flavor | App ID | Backend URL |
|--------|--------|-------------|
| `local` | (uses dev ID) | `http://localhost:8888/mcrs-api` (configurable) |
| `dev` | `com.chondid.app.dev` | Company ALB (AWS) |
| `stg` | `com.chondid.app.stg` | Vendor staging (temporary) |
| `prod` | `com.chondid.app` | Vendor production (temporary) |

Flavor URLs are defined in [`lib/flavors.dart`](./lib/flavors.dart).

## Branch Strategy

| Branch | Purpose | CI effect |
|--------|---------|-----------|
| `main` | Production-ready code. Do NOT push directly. | Ships prod AAB to Google Play internal track |
| `stg` | Staging / UAT. | Ships stg APK to Firebase App Distribution |
| `dev` | Daily development. | Ships dev APK to Firebase App Distribution |
| `vendor/final-delivery` | Vendor pushes handover code here. | Analyze only |

Workflow: `dev` → `stg` (UAT) → PR → `main` (prod)

## Getting Started

### Prerequisites

- Flutter 3.29.3 (use [FVM](https://fvm.app/) — config in `.fvmrc`)
- Xcode (for iOS, macOS only)
- Android Studio or Android SDK
- A local `.env` file

### Setup

```bash
# Install Flutter version
fvm install

# Install dependencies
flutter pub get

# Create environment file
cp .env.example .env
# Fill in API_KEY and OCR_SECRET in .env

# Generate code (localizations + freezed models)
dart run intl_utils:generate
dart run build_runner build --delete-conflicting-outputs
```

### Run

```bash
# Local flavor (local backend)
flutter run --flavor dev --dart-define=APP_FLAVOR=local

# Local flavor (Android emulator → host machine)
flutter run --flavor dev --dart-define=APP_FLAVOR=local --dart-define=LOCAL_API_BASE_URL=http://10.0.2.2:8888/mcrs-api

# Dev flavor (company AWS backend)
flutter run --flavor dev --dart-define=APP_FLAVOR=dev

# Staging / Production
flutter run --flavor stg --dart-define=APP_FLAVOR=stg
flutter run --flavor prod --dart-define=APP_FLAVOR=prod
```

### IDE Setup

**Android Studio / IntelliJ:**
1. Open project, run `flutter pub get`
2. Ensure `.env` file exists
3. Add `--flavor dev --dart-define=APP_FLAVOR=dev` to run configuration
4. Run from `lib/main.dart`

**VS Code:**
1. Open project, run `flutter pub get`
2. Ensure `.env` file exists
3. Configure `.vscode/launch.json` with flavor args
4. Run from `lib/main.dart`

## Build

```bash
# Android APK (dev)
flutter build apk --flavor dev --dart-define=APP_FLAVOR=dev

# Android App Bundle (prod, for Play Store)
flutter build appbundle --flavor prod --dart-define=APP_FLAVOR=prod --release

# iOS (prod)
flutter build ios --flavor prod --dart-define=APP_FLAVOR=prod --release
```

## Release Signing (Android)

Release keystore is configured in `android/app/build.gradle` and loaded from `android/key.properties` (gitignored). The keystore file `android/app/chon-release.jks` is also gitignored.

For CI release builds, keystore credentials are stored as GitHub Actions secrets (see [CI/CD](#cicd) section). To regenerate the `KEYSTORE_BASE64` secret locally:

```bash
base64 -i android/app/chon-release.jks | pbcopy  # macOS
base64 -w 0 android/app/chon-release.jks         # Linux
```

## Distribution

### Firebase App Distribution (dev builds)
- Project: `chon-app` (Firebase Console)
- Testers managed in **Release & Monitor → App Distribution → Testers & Groups**
- Group: `internal-testers`
- Testers install the **Firebase App Tester** Android app to receive builds

### Google Play (prod builds)
- Package: `com.chondid.app`
- Organization: CHON (Account ID: `5545205235125853585`)
- Prereqs before first release: complete identity verification, website authentication, and phone verification in Play Console
- First release must be promoted manually from the Play Console; subsequent internal-track updates auto-upload via CI

### TestFlight / App Store (iOS)
- Pending Apple Developer account purchase

## Secrets

Do not commit: API keys, OCR secrets, production credentials, keystore files.

Use:
- `.env` for local development (gitignored)
- GitHub Actions secrets for CI/CD
- `android/key.properties` for release signing (gitignored)

## External Services

- **Backend API**: CHON backend (Spring Boot)
- **OpenAI**: Chatbot feature (`api.openai.com`)
- **Naver Cloud**: OCR for document scanning
