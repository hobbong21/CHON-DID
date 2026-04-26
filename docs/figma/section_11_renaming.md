# Section 11 — Figma 프레임 리네이밍 권장

CHON 1.1 페이지(`151:14267`)의 Section 11 영역에 있는 11개 프레임이 모두 `Edit profile_NN` 이름으로 잘못 라벨되어 있습니다. 페이지의 라벨 프레임(`602:46030 — 11. Report a problem`)과 진입 버튼(`문제신고_Button`)이 가리키는 실제 의미는 **문제 신고 (Report)** 플로우입니다.

이 문서는 Figma 작업자에게 권장하는 리네이밍 매핑입니다. 코드에는 이미 v2 모듈(`mobile/lib/presentations/modules/report_v2/`)이 들어있고 프레임 이름과 무관하게 동작하지만, 디자인 문서 정합성을 위해 정리 권장.

## 매핑 표

페이지에서 y 좌표 기준으로 행이 나뉘어 있습니다.

### Row 1 (y = 23903) — 진입 + 폼 시작

| 현재 이름 | nodeId | 추정 역할 | 제안 이름 |
|---|---|---|---|
| Home | `602:45977` | 신고 진입 — Home 변형 (`문제신고_Button` 강조) | `Report_Entry` |
| Edit profile_01 | `707:11967` | 신고 목록 / 빈 상태 | `Report_01_List` |
| Edit profile_02 | `707:12311` | 신규 신고 폼 — 카테고리 또는 첫 입력 | `Report_02_Compose_Step1` |
| Edit profile_03 | `602:46011` | 폼 — 제목/내용 입력 | `Report_03_Compose_Step2` |
| Edit profile_04 | `707:12051` | 폼 — 첨부 (height 838로 더 김) | `Report_04_Attach` |

### Row 2 (y = 24850) — 송신/검토

| 현재 이름 | nodeId | 추정 역할 | 제안 이름 |
|---|---|---|---|
| Edit profile_05 | `707:12497` | 송신 직전 검토 / 확인 다이얼로그 | `Report_05_Confirm` |
| Edit profile_06 | `707:12666` | 송신 중 (로딩) | `Report_06_Sending` |
| Edit profile_07 | `707:12924` | 송신 직후 응답 대기 | `Report_07_Awaiting` |
| Edit profile_08 | `707:13010` | 접수 완료 | `Report_08_Submitted` |

### Row 3 (y = 25797) — 결과 / 실패

| 현재 이름 | nodeId | 추정 역할 | 제안 이름 |
|---|---|---|---|
| Edit profile_09 | `707:13096` | 답변 알림 / 후속 안내 | `Report_09_Followup` |
| Edit profile_10 | `707:13316` | 송신 실패 / 재시도 | `Report_10_Failed` |

> 위 추정은 화면 위치와 height(`807` 정도가 표준, `838`은 폼이 길어진 경우)를 기준으로 한 합리적 추측입니다. Figma에서 직접 화면을 보고 정확히 어느 게 어느 단계인지 매칭한 후 이름을 적용하세요.

## Figma 데스크톱에서 일괄 리네이밍

1. 데스크톱 Figma에서 CHON 1.1 파일 열기
2. 좌측 Layers 패널을 펼치고 Section 11 영역으로 스크롤
3. 각 프레임을 클릭 → `F2` 또는 더블클릭 → 이름 변경
4. 또는 우상단 검색에서 `Edit profile_` 입력해서 한꺼번에 찾고 수정

## 코드에 미치는 영향

코드 측 v2 모듈은 이름이 아니라 **stage 머신**으로 흐름을 다룹니다 (`list / compose / submitting / submitted / failed`). 따라서 Figma에서 이름이 바뀌어도 코드는 그대로 동작합니다. 다만:

- [`docs/figma/index.md`](./index.md) Section 11 표는 리네이밍 후 갱신 권장
- 향후 `get_design_context`로 픽셀 정밀 변환할 때, 잘못된 이름이 reference code의 클래스 이름으로 들어가는 걸 막아줍니다

## 코드 매핑 (현재 v2 stage 기준)

| Stage (코드) | 추정 매핑 Figma 프레임 |
|---|---|
| `list` | `Report_01_List` (`707:11967`) |
| `compose` | `Report_02_Compose_Step1` ~ `Report_05_Confirm` (`707:12311` 외) |
| `submitting` | `Report_06_Sending` ~ `Report_07_Awaiting` (`707:12666`, `707:12924`) |
| `submitted` | `Report_08_Submitted` ~ `Report_09_Followup` (`707:13010`, `707:13096`) |
| `failed` | `Report_10_Failed` (`707:13316`) |

이렇게 stage별 1~2 화면이 매핑되는 구조입니다. 향후 스플릿 디자인이 필요해지면 stage를 더 세분화 (e.g. `submitting.preparing` vs `submitting.uploading`)하면 됩니다.
