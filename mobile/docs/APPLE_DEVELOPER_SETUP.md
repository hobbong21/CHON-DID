# Apple Developer & TestFlight Setup Guide

Full path to get CHON iOS onto TestFlight and the App Store. This is significantly more involved than Play Store — plan on 1–3 weeks of elapsed time because of Apple's D-U-N-S validation.

## Prerequisites

- An Apple ID for the CHON organization (**don't use a personal Apple ID**)
- Business registration documents (for Organization account)
- A D-U-N-S number for CHON (see Phase 1)
- macOS machine with Xcode (for initial local signed build)
- GitHub repo admin

---

## Phase 1 — Get a D-U-N-S number

Required for Organization (company) Apple Developer accounts. Individual accounts skip this but lose the ability to show your company name on the App Store.

1. Check if CHON already has one: https://developer.apple.com/enroll/duns-lookup/
2. If not, request a free one from Dun & Bradstreet via that same page
3. Apple's D&B process can take **7–14 business days** — start this *today* if you haven't already
4. Save the D-U-N-S number for Phase 2

---

## Phase 2 — Purchase Apple Developer Program membership

- $99 USD / year
- https://developer.apple.com/programs/enroll/
- Choose **Organization** (not Individual)
- Enter D-U-N-S, legal entity name, address
- Apple manually reviews (can take hours to days)
- You'll receive an email when approved

Once approved, you'll have access to:
- App Store Connect (for publishing apps)
- Certificates, Identifiers & Profiles portal
- TestFlight

---

## Phase 3 — Realign iOS bundle identifiers

**Before doing anything in Apple's portal**, fix the vendor's leftover iOS bundle IDs so they match Android.

Current state (from `ios/Runner.xcodeproj/project.pbxproj`):
- `com.abdulkarim.chondev` — someone's personal account, must be changed
- `com.chon.poc` — POC identifier, must be changed

Target state (matches Android):

| Flavor | Bundle ID |
|---|---|
| dev | `com.chondid.app.dev` |
| stg | `com.chondid.app.stg` |
| prod | `com.chondid.app` |

### How to change them

**Option A: via Xcode GUI (recommended)**

1. Open `ios/Runner.xcworkspace` in Xcode
2. Select the Runner project → Runner target → **Signing & Capabilities**
3. Top scheme dropdown → switch to each flavor scheme (Runner-dev, Runner-stg, Runner-prod)
4. For each scheme, update **Bundle Identifier** to the matching value above
5. Save and commit the modified `project.pbxproj`

**Option B: direct pbxproj edit (risky — backup first)**

```bash
cp ios/Runner.xcodeproj/project.pbxproj ios/Runner.xcodeproj/project.pbxproj.backup
# Then edit PRODUCT_BUNDLE_IDENTIFIER lines manually, keeping the UUIDs intact
```

---

## Phase 4 — Register App IDs in Apple Developer portal

1. **https://developer.apple.com/account/resources/identifiers/list**
2. For each of the 3 bundle IDs (`com.chondid.app.dev`, `.stg`, and the prod one):
   - **+ → App IDs → Continue**
   - Type: **App**
   - Description: e.g. `CHON SelfID — dev`
   - Bundle ID: explicit, e.g. `com.chondid.app.dev`
   - Capabilities: leave defaults (enable Push, Sign in with Apple, etc. later if needed)
   - **Continue → Register**

---

## Phase 5 — Create signing certificates

### 5a. Distribution certificate (one per team, not per app)

1. On macOS, Keychain Access → Certificate Assistant → **Request Certificate from a Certificate Authority**
2. Save the CSR file to disk
3. https://developer.apple.com/account/resources/certificates/list → **+**
4. Select **Apple Distribution** → **Continue**
5. Upload the CSR → **Continue** → **Download** the `.cer` file
6. Double-click the `.cer` to add it to Keychain
7. In Keychain, find the certificate → right-click → **Export** → save as `.p12` with a strong password
8. Keep the `.p12` file and password safe — you'll need them for CI

### 5b. Provisioning profiles (one per app, per distribution type)

For each of the 3 bundle IDs, create an **App Store** provisioning profile:

1. https://developer.apple.com/account/resources/profiles/list → **+**
2. Type: **App Store**
3. App ID: select one of the 3 you registered
4. Certificate: select the Apple Distribution cert from 5a
5. Profile name: e.g. `CHON SelfID Dev App Store`
6. **Generate** → **Download** the `.mobileprovision` file

Repeat 3× (dev, stg, prod).

---

## Phase 6 — Create App Store Connect app record

1. https://appstoreconnect.apple.com → **My Apps → +**
2. Fill:

| Field | Value (prod example) |
|---|---|
| Platform | iOS |
| Name | `CHON` |
| Primary language | Korean |
| Bundle ID | `com.chondid.app` |
| SKU | `CHON-SELFID-PROD` (your internal tracker) |
| User Access | Full Access |

3. **Create**

Repeat for `.dev` and `.stg` if you want separate TestFlight lanes for them (recommended).

---

## Phase 7 — Generate App Store Connect API key

This is what CI uses to upload builds to TestFlight.

1. App Store Connect → **Users and Access** → **Integrations → App Store Connect API**
2. **+** to generate a new key
3. Name: `CHON CI`
4. Access: **App Manager** (NOT Admin — least privilege)
5. **Generate**
6. **IMMEDIATELY** download the `.p8` file — you can only download it once
7. Record the **Key ID** (shown on the key row, e.g. `XYZ1234ABC`)
8. Record the **Issuer ID** (shown at the top of the page, a UUID)

---

## Phase 8 — Wire secrets into GitHub

Convert the sensitive files to base64 and add as GitHub secrets.

```bash
# From the directory where you saved them
base64 -i AuthKey_XYZ1234ABC.p8   | pbcopy
gh secret set APP_STORE_CONNECT_API_KEY_BASE64 --body "$(pbpaste)"

gh secret set APP_STORE_CONNECT_KEY_ID --body "XYZ1234ABC"
gh secret set APP_STORE_CONNECT_ISSUER_ID --body "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"

base64 -i chon_distribution.p12   | pbcopy
gh secret set IOS_CERTIFICATE_BASE64 --body "$(pbpaste)"
gh secret set IOS_CERTIFICATE_PASSWORD --body "the-p12-password"

base64 -i CHON_SelfID_Dev_AppStore.mobileprovision | pbcopy
gh secret set IOS_PROVISIONING_PROFILE_BASE64 --body "$(pbpaste)"
```

---

## Phase 9 — Build and upload the first IPA manually

Just like Play Store, Apple wants a human to push the first build before API uploads are allowed.

1. On macOS, open `ios/Runner.xcworkspace` in Xcode
2. Scheme: Runner-dev (or whichever flavor you're testing first)
3. Destination: **Any iOS Device (arm64)**
4. **Product → Archive**
5. When Organizer opens, click **Distribute App → App Store Connect → Upload → Next → Next → Upload**
6. Wait ~10 min for Apple to process the build (you'll get an email)
7. App Store Connect → **TestFlight** → the build appears
8. Add **internal testers** (team members) and submit for external testing if you want to share with non-team testers

---

## Phase 10 — Enable CI TestFlight automation

1. Edit `.github/workflows/mobile-ci.yml`
2. Find the `build-ios-dev` job
3. **Uncomment** the `Import signing certificate`, `Install provisioning profile`, `Build signed IPA`, and `Upload to TestFlight` steps
4. Make sure the `.mobileprovision` filename in the workflow matches what you saved it as
5. Create `ios/ExportOptions.plist` (see template below)
6. Push to `main` → CI uploads to TestFlight on every push

### ios/ExportOptions.plist template

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>method</key>
  <string>app-store</string>
  <key>teamID</key>
  <string>YOUR_10_CHAR_TEAM_ID</string>
  <key>uploadBitcode</key>
  <false/>
  <key>uploadSymbols</key>
  <true/>
  <key>signingStyle</key>
  <string>manual</string>
  <key>provisioningProfiles</key>
  <dict>
    <key>com.chondid.app.dev</key>
    <string>CHON SelfID Dev App Store</string>
  </dict>
</dict>
</plist>
```

Swap `YOUR_10_CHAR_TEAM_ID` for the Team ID from the Apple Developer portal → Membership page.

---

## Troubleshooting

### "No profile for team matching ... was found"

The provisioning profile you installed doesn't match the bundle ID + certificate combination. Re-check:
- Bundle ID in Xcode matches the profile's App ID
- Certificate in Keychain matches the one used to create the profile
- Profile isn't expired (max 1 year)

### "Missing export compliance information"

You'll need to answer encryption declaration questions the first time a build reaches TestFlight. Can be pre-declared in `Info.plist` with `ITSAppUsesNonExemptEncryption = false` (most apps qualify).

### Uploads stuck "processing" in App Store Connect

Normal for 10–30 min. If stuck for >2 hours, Apple rejected the build silently. Check the email tied to your Apple ID for a rejection reason.

### "D-U-N-S lookup failed"

D&B takes 7–14 business days. No way to expedite. Plan around this.

---

## Estimated timeline

| Phase | Duration |
|---|---|
| 1 — D-U-N-S | 7–14 business days |
| 2 — Dev Program enrollment | 1 hour – 2 days |
| 3 — Bundle ID realignment | 30 min (local code) |
| 4 — App ID registration | 15 min (web portal) |
| 5 — Certificates & profiles | 45 min |
| 6 — App Store Connect app | 15 min |
| 7 — API key | 10 min |
| 8 — GitHub secrets | 15 min |
| 9 — First manual upload | 30 min + Apple processing time |
| 10 — Enable CI | 20 min |

**Total active work**: ~3 hours
**Total elapsed time**: 2–3 weeks (waiting on D-U-N-S and Apple reviews)
