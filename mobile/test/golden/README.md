# Golden tests — v2 pages

Snapshot tests for the v2 pages introduced in the CHON 1.1 redesign. Each test renders one page (or one stage of a stage-driven page) and compares the rendered pixels against a saved PNG. They catch design regressions that other tests miss because:

* widget tests assert on **structure** (`find.text(...)` / `find.byType(...)`), not appearance — a font swap, color drift, or padding regression flies under their radar
* unit tests cover business logic, not rendering at all
* integration tests cover end-to-end behavior, not pixel detail

The goldens live next to the test files in `goldens/` and are tracked in git as binary assets.

## What is covered

| Test file                                        | Pages snapshotted                                                                  |
|--------------------------------------------------|-------------------------------------------------------------------------------------|
| `v2_pages_simple_golden_test.dart`               | `SplashPageV2`, `TutorialPage` (step 1), `MutualAuthOfflineEntryPage`               |
| `v2_pages_with_cubits_golden_test.dart`          | `MutualAuthRequestPage` (search + confirm), `ReportV2Page` (list-empty), `IdGenerationV2Page` (start), `FamilyTreeV2Page` (empty) |

That covers 9 distinct screens from the v2 redesign — every section that has a v2 page either gets at least one golden directly or has its underlying widgets golden-covered through `chon_bottom_navigation_bar` / `chon_quick_action_button` widget tests.

## Running

```bash
# Verify against committed goldens (default)
fvm flutter test test/golden

# Regenerate after an intentional design change
fvm flutter test test/golden --update-goldens

# Run only goldens, skip the rest
fvm flutter test --tags golden
```

If a golden mismatches you'll see a diff PNG written next to the failing test under `failures/`. Inspect it before deciding to update — most of the time a "small" mismatch is actually a real regression.

## Workflow for design changes

1. You're about to ship a design change (new color, padding, font, etc.).
2. Run `flutter test test/golden` — expect failures on the affected pages.
3. Inspect each failure PNG in `failures/` to confirm the diff matches what you intended.
4. Run `flutter test test/golden --update-goldens` to accept the new pixels.
5. Commit the regenerated PNGs along with your code change. Reviewers will see them in the PR diff and can spot unintended visuals.

If you accept goldens without inspecting the diff, you defeat the entire point of these tests.

## Platform sensitivity (important)

Flutter's golden tests are **platform-specific** because text shaping and the Skia rasterizer differ between Linux / macOS / Windows. The committed goldens reflect whichever machine generated them. To keep CI green:

* **Recommended**: standardise on Linux for goldens. Run `flutter test test/golden --update-goldens` on Linux (or a Linux container) and only commit those PNGs.
* If a developer regenerates on Windows or macOS, the saved PNGs will diverge and CI will fail.

Tag-based isolation: every golden test is tagged `golden` so CI can run them in a dedicated step:

```bash
flutter test --tags golden  # only run goldens
flutter test --exclude-tags golden  # skip goldens, run everything else
```

## Why we don't snapshot every v2 page

Some v2 pages are too dependent on platform plugins or runtime data to make stable goldens worthwhile:

| Page                            | Why no golden                                                                  |
|---------------------------------|--------------------------------------------------------------------------------|
| `MutualAuthQrDisplayPage`       | Uses `qr_flutter`'s `QrPainter` which depends on the underlying QR data.       |
| `MutualAuthQrScanPage`          | Renders a `MobileScanner` camera preview — not deterministic in widget tests. |
| `IdGenerationV2Page` (capture stages) | Same camera preview problem.                                              |
| `MutualAuthReceivePage` (signing stage) | Animated lottie / spinner — non-deterministic without `tester.pump(duration)` plumbing. |
| `AiChatV2Page`                  | Renders a chat bubble list bound to a streaming `ChatBotCubit`; the typing indicator animation makes goldens flaky. |
| `ProfileEditV2Page`             | Form heavy — the unit + widget tests already exercise validation.              |
| `InProcContactPage`             | Pulse animation makes the phone icon non-deterministic.                        |

These pages are still covered by widget + unit tests. If you need to lock down their layout too, prefer widget tests that assert on `LayoutBuilder` constraints / `Padding.padding` values rather than full bitmap goldens.

## Pretendard font

`golden_test_harness.dart::loadPretendardFont()` tries to register `assets/fonts/PretendardVariable.ttf` with the Flutter test font registry so golden snapshots use the actual production font. If the file is missing the helper silently falls back to Flutter's default font; the goldens just need to be regenerated on the same env that runs them in CI.

## CI 통합

`.github/workflows/mobile_test.yml` 에 `golden` job 으로 분리되어 있고 `flutter test --tags golden` 만 실행. 베이스라인 PNG 생성 절차와 디자인 갱신 흐름은 [`docs/golden_baseline_workflow.md`](../../../docs/golden_baseline_workflow.md) 참고.

## Updating goldens — checklist

When committing regenerated goldens, double-check:

- [ ] PRs don't show *unrelated* PNG changes — those are the platform-divergence smell. If they appear, regenerate on the canonical (Linux) env.
- [ ] Each updated PNG corresponds to an intentional design change in the same PR.
- [ ] PR description calls out which design tokens / pages were touched.
- [ ] CI passes after the update — confirms the goldens match in CI's env.
