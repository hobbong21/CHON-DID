# Golden 베이스라인 워크플로

## 무엇이고 왜 필요한가

`mobile/test/golden/` 의 골든 테스트들은 페이지 첫 프레임 픽셀과 저장된 PNG를 비교합니다. 따라서 첫 베이스라인 PNG가 한 번은 어딘가에서 생성되어야 합니다. 그렇지 않으면 CI에서 `flutter test --tags golden` 이 매번 PNG missing 으로 실패합니다.

이 문서는 그 *최초 1회* 생성을 누가, 어디서, 어떻게 해야 하는지 + 그 후 디자인 변경 시 갱신 흐름을 정리합니다.

## 베이스라인 생성 — 1회성 (필수)

> **CI가 골든 검증을 시작하기 *전에* 반드시 1회 수행되어야 합니다.** 베이스라인이 없으면 CI에서 `MissingGoldensError` 가 나면서 PR 머지가 막힙니다.

### 권장 실행 환경

- **OS**: Linux (Ubuntu 22.04 또는 20.04 권장 — GitHub Actions 의 `ubuntu-latest` 와 동일 베이스로 PNG diff 최소화)
- **Flutter**: 3.29.3 stable (정확히 같은 버전)
- **Pretendard 폰트**: `mobile/assets/fonts/PretendardVariable.ttf` 존재 (이미 commit 되어 있음)

WSL2 / 클린 Linux 컨테이너에서도 OK. macOS / Windows 에서 만든 PNG 는 *반드시* CI 와 어긋나므로 절대 쓰지 마세요.

### 절차

```bash
cd mobile
fvm flutter pub get
fvm flutter pub run intl_utils:generate
fvm flutter pub run build_runner build --delete-conflicting-outputs

# 첫 PNG 생성 — 8개 골든 (simple 3 + cubit 5)
fvm flutter test test/golden --update-goldens

# 결과 확인
ls -la test/golden/goldens/
# splash_page_v2.png
# tutorial_page_step1.png
# mutual_auth_offline_entry_page.png
# mutual_auth_request_search_step.png
# mutual_auth_request_confirm_step.png
# report_v2_list_empty.png
# id_generation_v2_start.png
# family_tree_v2_empty.png

# 검증 — diff 없어야 함
fvm flutter test test/golden
# Expected to pass with "00:0X +N: All tests passed!"
```

### 커밋

```bash
git add mobile/test/golden/goldens/
git commit -m "test: golden 베이스라인 8개 생성 (Linux, Flutter 3.29.3)"
```

> PR 메시지에 **어떤 OS / Flutter 버전에서 생성했는지** 명시하세요. 그래야 다음 사람이 같은 환경에서 갱신할 수 있습니다.

## 디자인 변경 후 갱신

CHON 디자인 토큰을 바꾸거나 v2 페이지의 첫 프레임 모양을 의도적으로 수정했을 때:

1. **로컬에서 재생성** (Linux 권장)

   ```bash
   cd mobile
   fvm flutter test test/golden --update-goldens
   ```

2. **diff 검토** — `git diff` 로 PNG 변경 확인 (binary diff 라 GitHub PR 뷰에서 image diff 보임)

3. **PR 메시지에 의도 명시**

   > "ChonColors.textSecondary 를 #5A5A5A → #5C5C5E 로 변경. 5 골든 PNG 갱신."

4. **Linux 가 아닌 머신에서 재생성한 경우 PR 에 주의 표기**

   > "Generated on macOS 14.5 — CI 가 픽셀 시프트로 실패할 수 있음. CI 결과 보고 ubuntu runner 에서 재생성 필요"

## CI 동작 (`.github/workflows/mobile_test.yml`)

두 개의 독립 잡:

```text
test (ubuntu-latest)  →  needs: test  →  golden (ubuntu-latest)
   │                                          │
   ├─ flutter pub get                          ├─ flutter pub get
   ├─ codegen (intl_utils + build_runner)      ├─ codegen
   ├─ dart format --set-exit-if-changed        ├─ flutter test --tags golden
   ├─ flutter analyze --fatal-infos            └─ on failure: upload PNG diffs
   └─ flutter test --exclude-tags golden
```

`--exclude-tags golden` / `--tags golden` 분리로 golden 잡이 unit 잡을 차단하지 않음. golden 잡은 unit 잡이 통과해야만 시작(`needs: test`).

### 실패 PNG 다운로드

CI 가 골든 mismatch 로 실패하면 PR 의 Actions 탭 → 해당 run → Artifacts → `golden-failures-<run_id>.zip` 다운로드 → 안에 `failures/` 디렉터리에 다음 3종 PNG가 있음:

- `<test_name>_testImage.png` — 이번 run 에서 렌더된 실제 픽셀
- `<test_name>_masterImage.png` — git 에 저장된 베이스라인
- `<test_name>_isolatedDiff.png` — diff highlight (빨간 영역)

이 셋을 보고 → 의도된 디자인 변경이면 로컬에서 `--update-goldens` → 새 PNG 커밋. 의도되지 않은 회귀면 코드 수정.

## 일반적인 함정 + 해결

### "MissingGoldensError" 가 CI 첫 실행에 발생

→ 위 "베이스라인 생성" 절차를 한 번 수행해서 PNG 를 commit 해야 함. 베이스라인 없는 상태에서 CI 가 골든을 검증할 수는 없음.

### 로컬은 통과 / CI 만 실패

거의 항상 **OS 미스매치** 입니다. macOS 나 Windows 에서 PNG 를 만들었으면 CI(linux)와 어긋남. 해결: WSL2 또는 Docker 의 ubuntu 컨테이너에서 `--update-goldens` 후 commit.

```bash
docker run --rm -it \
  -v "$PWD:/app" \
  -w /app/mobile \
  ghcr.io/cirruslabs/flutter:3.29.3 \
  bash -lc "flutter pub get && flutter test test/golden --update-goldens"
```

### 모든 golden 이 한 번에 다 실패함

대부분 폰트 로딩 실패. `mobile/assets/fonts/PretendardVariable.ttf` 가 존재하는지 + `pubspec.yaml` 의 `assets:` 섹션에 등록되어 있는지 확인. `silenceFlutterErrors()` 가 `Failed to load asset` 경고를 가렸을 가능성도 있음 — 그 경우 `golden_test_harness.dart` 의 silencer 를 잠시 끄고 stderr 보세요.

### PR 마다 PNG 가 살짝 바뀜 (binary diff 가 매번 발생)

Flutter / OS 패치 버전이 자주 변하는 환경(예: dependabot 이 image 태그를 매주 업데이트). 해결: CI 의 `subosito/flutter-action@v2` 에 `flutter-version: '3.29.3'` 을 정확히 핀 + ubuntu-latest 가 22.04 vs 24.04 로 점프하는 시점에 한 번 베이스라인 재생성.

## 향후 확장

- **golden_toolkit / alchemist** 같은 패키지로 디바이스/언어별 변형 자동 생성. 현재는 360×800 KO 로케일 1개만. 다국어(JA/EN/VI/ZH) 골든 추가 시 한 페이지당 5 PNG 가 생성됨 — git 저장소 size 영향 검토.
- **screenshot diff threshold** — 현재는 1픽셀이라도 다르면 실패. 폰트 anti-alias 등으로 인한 사소한 diff 를 0% threshold로 두면 false positive 다발. `golden_toolkit` 의 `pixelDiffThreshold` 같은 옵션 도입 고려.
- **CI artifact retention** — 현재 14일. golden 베이스라인이 안정화되면 7일로 줄여도 됨.
