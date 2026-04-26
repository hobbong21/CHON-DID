# Google Play Store Setup Guide

End-to-end steps to take CHON from an unverified Play Console account to an automated Play internal-testing pipeline. Follow in order.

## Prerequisites

- Google Play Console organization account: **CHON** (Account ID `5545205235125853585`)
- Owner of Firebase project `chon-app` (reuses the same GCP org, which simplifies permissions)
- GitHub repo admin (to add secrets)
- A signed AAB built locally at least once (needed for first manual upload)

---

## Phase 1 — Complete Play Console account verification

Blocks every other step. Do this first.

1. Play Console → **Developer Account → Account details**
2. Complete each item:
   - **Identity verification** — upload business registration / certificate of incorporation. Takes 2–3 business days
   - **Organization website authentication** — verify ownership of `chon.ai` via DNS TXT record
   - **Phone number verification** — requires identity + website to be approved first
3. Wait for the green "Verified" badge on all three

Until verified, the "Create app" button is disabled.

---

## Phase 2 — Create the app listing

Once verified, in Play Console:

1. Click **Create app** (top right)
2. Fill the form:

| Field | Value |
|---|---|
| App name | `CHON` |
| Default language | `Korean – ko-KR` |
| App or game | App |
| Free or paid | Free |
| Developer Program Policies | ✅ accept |
| US export laws | ✅ accept |

3. **Create app**

You land on the app dashboard.

---

## Phase 3 — Minimum viable internal-testing listing

You don't need a full store listing to distribute internal builds, but you do need:

1. **App access** — if login is required, tell Google how to test. "No, my app requires authentication, here are test credentials: …"
2. **Ads** — "No, my app does not contain ads" (or yes, with declaration)
3. **Content rating** — take the questionnaire (10 minutes). This is blocking even for internal testing
4. **Target audience and content** — declare age groups
5. **News app** — No (unless true)
6. **COVID-19 contact tracing and status** — No
7. **Data safety** — declare what data is collected, stored, and shared. Map this to CHON's actual collected data (name, phone, DID, etc.)
8. **Government apps** — No
9. **Financial features** — No (unless CHON expands to finance vertical)

These are all in the **App content** section of the left sidebar.

---

## Phase 4 — Upload the first AAB manually

The Play Developer API **cannot upload the first release**. Google requires a human to upload the first APK/AAB through the Console UI. After that, CI automation takes over.

1. Locally, build a signed prod AAB:
   ```bash
   flutter build appbundle \
     --flavor prod \
     --dart-define=APP_FLAVOR=prod \
     --release
   ```
   Output: `build/app/outputs/bundle/prodRelease/app-prod-release.aab`

2. Play Console → **Testing → Internal testing**
3. **Create new release**
4. Drop the AAB into the uploader
5. Fill release name (e.g. `1.0.1-internal-1`) and release notes
6. **Review release** → **Start rollout to internal testing**

If Google flags any missing declarations, fix them in App content and retry.

---

## Phase 5 — Create Play Developer API service account

This is the account CI will use to upload subsequent releases.

### 5a. Create the service account in Google Cloud

1. Go to **https://console.cloud.google.com/iam-admin/serviceaccounts**
2. Top dropdown: select the `chon-app` project
3. **+ Create service account**
4. Fill:
   - **Name**: `play-publisher-ci`
   - **ID**: auto
   - **Description**: `CI uploads to Google Play internal track`
5. **Create and continue** → skip "Grant this service account access" → **Done**

### 5b. Generate a JSON key

1. Click the `play-publisher-ci` row → **Keys** tab
2. **Add key → Create new key → JSON → Create**
3. Download the `.json` file (keep it secure, don't commit)

If key creation is blocked by org policy, see "Troubleshooting" below.

### 5c. Link the service account to Play Console

1. Play Console → **Setup → API access**
2. If not already linked, click **Link a Google Cloud project** → select `chon-app`
3. Under **Service accounts**, find `play-publisher-ci@chon-app.iam.gserviceaccount.com`
4. Click **Grant access**
5. Choose role: **Release manager**
6. Restrict to app: `CHON` (so it can only touch this app)
7. **Invite user** → **Send invite**

Wait ~5 minutes for the linkage to propagate.

---

## Phase 6 — Wire it into CI

1. Open the downloaded JSON file in any editor
2. Copy the entire contents
3. Add to GitHub secrets:
   ```bash
   gh secret set GOOGLE_PLAY_SERVICE_ACCOUNT --body "$(cat /path/to/play-publisher-ci.json)"
   ```
   Or via UI: Settings → Secrets and variables → Actions → New repository secret → `GOOGLE_PLAY_SERVICE_ACCOUNT`

4. Delete the local JSON file (`rm /path/to/play-publisher-ci.json`) — it's now in GitHub secrets

---

## Phase 7 — Test the automation

1. Push any commit to `main`
2. GitHub Actions → Mobile CI → `Build & Upload Android (prod)` job
3. Watch it upload to Play Console as a draft release
4. Play Console → Internal testing → you should see the new draft
5. Promote to internal testing (or leave as draft) — this is manual by design so code never auto-ships

---

## Troubleshooting

### "Keys cannot be created for this service account" (org policy)

Your org has `iam.disableServiceAccountKeyCreation` enabled. Options:

1. Ask the Google Workspace admin to add a project-level exception for `chon-app`
2. Or use Workload Identity Federation instead of a JSON key (more secure but more setup — see GitHub's `google-github-actions/auth` action)

### "Package not found" when CI uploads

The first manual upload in Phase 4 hasn't happened yet, or it happened for a different package name. Double-check `packageName: com.chondid.app` in `.github/workflows/mobile-ci.yml` matches what's registered in Play Console.

### "Version code has already been used"

Android version codes must be monotonically increasing. CI uses `github.run_number` as the build number. If you ever rerun an old workflow or the run number resets (e.g. after a workflow rename), you'll see this error. Fix by pushing a new commit (which gets a new run number).

### CI uploads succeed but app never reaches testers

Release is uploaded as `draft` by design. Log in to Play Console → Internal testing → Manage releases → **Review release → Start rollout** to publish.
