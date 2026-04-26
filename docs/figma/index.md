# CHON 1.1 — Figma 디자인 인덱스

> **Figma 파일**: [CHON 1.1](https://www.figma.com/design/X44QW3oVr3BWkyW08m9zow/CHON-1.1)
> **페이지**: `260316 Lastest version (Do NOT touch !)` (`151:14267`)
> **fileKey**: `X44QW3oVr3BWkyW08m9zow`
> **총 프레임 수**: 125 (이 중 모바일 화면 ≈ 90, 섹션 라벨/공통 컴포넌트 제외)

이 인덱스는 페이지 안의 모든 섹션과 핵심 화면을 정리한 것입니다. 화면 단위 디자인 명세는 [home_spec.md](./home_spec.md)를 참고. 스크린샷은 채팅 위젯에서 인라인으로 보여드렸지만 Figma MCP의 URL은 단명이라 영구 보존이 필요하면 Figma 데스크톱에서 직접 export하시거나 fileKey + nodeId로 재요청해야 합니다.

## 디자인 토큰 (페이지 전체에서 추출)

### Color

| Role | Hex | 사용처 |
|------|-----|--------|
| `bg/page` | `#f5f5f5` | 모든 화면의 페이지 배경 |
| `bg/surface` | `#ffffff` | 카드, 바텀 내비, 모달 본체, 액션 그리드 |
| `bg/overlay` | `#000000 @60%` | 카메라/모달 오버레이 |
| `brand/primary` | `#ffa000` | 신분증 FAB, 주요 강조 |
| `brand/accent` | `#ff9500` | 로고 보조색 |
| `brand/dark` | `#0c0c16` | 로고 베이스 |
| `text/primary` | `#1e1e1e` | 본문 타이틀, 액션 라벨 |
| `text/secondary` | `#5a5a5a` | 보조 텍스트, 활성 nav |
| `text/tertiary` | `#8e8e93` | 비활성 nav 라벨 |
| `text/inverse` | `#ffffff` | 다크 배경 위 텍스트 |
| `icon/disabled` | `#bfbfbf`, `#b4b2b3` | 비활성 아이콘 stroke |
| `icon/strong` | `#404040` | 알림 아이콘 stroke |

### Typography (Pretendard 베이스, 시스템 바만 Roboto)

| Role | Style |
|------|-------|
| Display / Card title | Pretendard **Bold 22px** / 100~105% |
| Action label | Pretendard **Bold 14px** / 80~86% |
| Section label | Pretendard Medium 14px / 105% |
| Body | Pretendard Medium 14~16px / 90~130% (자간 -1.5%) |
| Nav label | Pretendard (Std Variable) Medium 12px / 100% |
| System (status bar) | Roboto Regular 14px / 20px |

### Shape & Spacing

- **Card radius**: 20
- **Pill / FAB radius**: 50
- **Page horizontal padding**: 16
- **Section vertical gap**: 8 / 10
- **Button inner padding**: 12/8 (Quick Action), 20/16 (Card)

## 섹션 구조 (총 12개 섹션)

| # | 섹션 | 화면 수 | 섹션 라벨 노드 |
|---|------|---------|----------------|
| 0 | Splash Screen | 1 | `182:20600` |
| 1 | Tutorial | 4 | `182:20761` |
| 2 | Home / Start | 5 (Home + Start_01~03) | `347:4867` + `473:28012` |
| 3 | ID Generation | 28 | `182:23375` |
| 4 | MutualAuth_Online (Request) | 6 | `473:29237` |
| 5 | MutualAuth_Online (Receive) | 8 | `347:21950` |
| 6 | MutualAuth_Offline_Request | 5 | `376:23834` |
| 7 | Family Tree | 8 | `602:31011` |
| 8 | InProc_Contact | 3 | `362:18041` |
| 9 | AI Chat | 12 | `376:25350` |
| 10 | Edit profile | 2 | `602:44122` |
| 11 | Report a problem | 11 | `602:46030` |

> **공통 패턴**: 각 기능 섹션은 보통 `Home (entry-point variant)` → `섹션_01` → `섹션_02` → ... 순으로 흐릅니다. Home의 Quick Action 4개(연락하기 / 프로필 수정 / QR 코드 / 고객센터)와 Bottom Nav의 5개(홈 · CHON · 신분증 FAB · 상호인증 · 가계도)가 각 섹션 진입점입니다.

## 섹션별 화면 목록

### 0. Splash Screen

| 이름 | nodeId | 크기 |
|------|--------|------|
| Splash Screen | `754:12524` | 360×800 |

### 1. Tutorial

| 이름 | nodeId | 크기 |
|------|--------|------|
| Tutorial_01 | `320:18658` | 360×800 |
| Tutorial_02 | `326:4129` | 360×800 |
| Tutorial_03 | `347:4189` | 360×800 |
| Tutorial_04 | `347:4285` | 360×800 |

### 2. Home / Start

| 이름 | nodeId | 크기 | 비고 |
|------|--------|------|------|
| **Home** | `473:27963` | 360×800 | 메인 홈. Quick Actions + 카드 + Bottom Nav. [상세 명세](./home_spec.md) |
| Start_01 | `473:28371` | 360×800 | 온보딩 진입 |
| Start_02 | `473:28909` | 360×800 | |
| Start_03 | `473:28838` | 360×800 | |

### 3. ID Generation (신분증 발급)

| 이름 | nodeId | 크기 | 비고 |
|------|--------|------|------|
| ID_01 | `182:23526` | 360×800 | 발급 시작 |
| PP_01_1 | `260:20879` | 360×800 | 개인정보 입력 1 |
| PP_01_2 | `300:3979` | 360×800 | 개인정보 입력 2 |
| PP_01_3 | `300:4018` | 360×800 | 개인정보 입력 3 |
| PP_01_4 | `300:4139` | 360×800 | 개인정보 입력 4 |
| PP_02_OK_01 | `260:20344` | 360×800 | 검증 성공 |
| PP_02_OK_F_01 | `260:21163` | 360×800 | 검증 실패 |
| ID Gen_02 | `300:4231` | 360×800 | |
| ID Gen_03_01 | `300:5122` | 360×800 | |
| ID Gen_03 | `300:5360` | 360×800 | |
| ID Gen_03_02 | `301:6407` | 360×800 | |
| ID Gen_03_03 | `182:21345` | 360×800 | |
| ID Gen_03_04 | `182:21311` | 360×800 | |
| ID Gen_03_05 | `182:21328` | 360×800 | |
| ID Gen_03_06 | `182:21275` | 368×808 | |
| ID Gen_03_02_01 | `301:6519` | 360×800 | 신분증 촬영 가이드 |
| ID Gen_03_02_01_01 | `301:6833` | 360×800 | |
| ID Gen_03_02_01_02 | `301:9642` | 360×800 | 카메라 (어두운 오버레이) |
| ID Gen_03_02_01_03 | `301:25075` | 360×992 | 스크롤 |
| ID Gen_03_02_01_04 | `301:25205` | 360×1071 | 스크롤 |
| ID Gen_03_02_02 | `301:6697` | 360×800 | |
| ID Gen_03_02_02_01 | `301:9740` | 360×800 | |
| ID Gen_03_02_03 | `301:6741` | 360×800 | |
| ID Gen_03_02_03_01 | `301:9828` | 360×800 | |
| ID Gen_03_02_04 | `301:6785` | 360×800 | |
| ID Gen_03_02_04_01 | `301:9995` | 360×913 | 스크롤 |
| ID Gen_03_02_04_02 | `301:24854` | 360×913 | 스크롤 |
| ID Gen_04 | `301:26743` | 360×800 | 발급 완료 |

### 4. MutualAuth Online (Request, 송신)

| 이름 | nodeId | 크기 |
|------|--------|------|
| MutualAuthReq_01 | `312:19987` | 360×800 |
| MutualAuthReq_02 | `312:20097` | 360×800 |
| MutualAuthReq_03 | `312:20291` | 360×800 |
| MutualAuthReq_04 | `312:20242` | 360×800 |
| MutualAuthReq_05 | `312:20366` | 360×800 |
| MutualAuthReq_06 | `473:29905` | 360×800 |

### 5. MutualAuth Online (Receive, 수신)

| 이름 | nodeId | 크기 | 비고 |
|------|--------|------|------|
| MutualAuthRcv_01 | `602:45448` | 360×800 | |
| MutualAuthRcv_02 | `347:23942` | 360×800 | |
| MutualAuthRcv_03 | `347:24126` | 360×800 | |
| MutualAuthRcv_04 | `376:21450` | 360×800 | |
| MutualAuthRcv_05 | `376:21525` | 360×800 | |
| MutualAuthRcv_06 | `473:30278` | 360×800 | |
| MutualAuthRcv_RJ_01 | `352:6580` | 360×800 | 거절 |
| MutualAuthRcv_RJ_02 | `356:6352` | 360×800 | 거절 |

### 6. MutualAuth Offline (QR 기반)

| 이름 | nodeId | 크기 | 비고 |
|------|--------|------|------|
| Home (offline entry) | `602:43544` | 360×800 | QR코드 버튼이 강조된 Home 변형 |
| InProc_QR_01 | `376:24285` | 360×800 | QR 표시 |
| InProc_QR_02 | `376:24436` | 360×800 | QR 스캔 |
| MutualAuthReq_02 (offline) | `853:22949` | 360×800 | 오프라인 변형 |
| MutualAuthRcv_03 (offline) | `536:14535` | 360×800 | 오프라인 변형 |

### 7. Family Tree (가계도)

| 이름 | nodeId | 크기 |
|------|--------|------|
| Family Tree_01 | `517:20730` | 360×800 |
| Family Tree_select_01 | `517:20765` | 360×800 |
| Family Tree_select_02 | `517:20800` | 360×800 |
| Family Tree_select_03_02 | `602:29899` | 360×800 |
| Family Tree_select_03_03 | `602:29934` | 360×800 |
| Family Tree_select_03_04 | `602:29969` | 360×800 |
| Family Tree_select_04_01 | `602:31029` | 360×800 |
| Family Tree_select_04_02 | `602:29866` | 360×800 |

### 8. InProc Contact (연락하기 처리)

| 이름 | nodeId | 크기 | 비고 |
|------|--------|------|------|
| Home (contact entry) | `602:45259` | 360×800 | 연락하기 강조 변형 |
| InProc_Contact_01 | `376:21766` | 360×800 | |
| InProc_Contact_02 | `376:22695` | 360×800 | |

### 9. AI Chat (챗봇)

| 이름 | nodeId | 크기 |
|------|--------|------|
| AI Chat_01 | `602:45133` | 360×800 |
| AI Chat_02_01 | `376:26362` | 360×800 |
| AI Chat_02_02 | `468:7184` | 360×800 |
| AI Chat_02_03 | `468:19362` | 360×800 |
| AI Chat_02_04 | `468:19468` | 360×800 |
| AI Chat_02_05 | `468:19618` | 360×800 |
| AI Chat_02_06 | `468:19775` | 360×800 |
| AI Chat_02_07 | `468:19836` | 360×800 |
| AI Chat_02_08 | `468:19997` | 360×800 |
| AI Chat_02_09 (a) | `468:20191` | 360×800 |
| AI Chat_02_09 (b) | `468:20428` | 360×800 |
| AI Chat_02_10 | `468:20260` | 360×800 |

### 10. Edit Profile (프로필 수정)

| 이름 | nodeId | 크기 | 비고 |
|------|--------|------|------|
| Home (profile entry) | `602:44432` | 360×800 | 프로필 수정 강조 변형 |
| Edit profile_01 | `602:44564` | 360×807 | |

### 11. Report a problem (문제 신고)

> ⚠️ Figma 안에서 프레임 이름이 모두 "Edit profile_NN"으로 잘못 라벨링되어 있습니다. 페이지 라벨 위치(`602:46030 — 11. Report a problem`)와 진입 버튼(`문제신고_Button`)으로 보아 실제로는 신고 플로우입니다. 정리 시 리네이밍 권장.

| 이름 (현재 / 추정) | nodeId | 크기 |
|---|---|---|
| Home (report entry) | `602:45977` | 360×800 |
| Edit profile_01 → Report_01 | `707:11967` | 360×807 |
| Edit profile_02 → Report_02 | `707:12311` | 360×807 |
| Edit profile_03 → Report_03 | `602:46011` | 360×807 |
| Edit profile_04 → Report_04 | `707:12051` | 360×838 |
| Edit profile_05 → Report_05 | `707:12497` | 360×807 |
| Edit profile_06 → Report_06 | `707:12666` | 360×807 |
| Edit profile_07 → Report_07 | `707:12924` | 360×807 |
| Edit profile_08 → Report_08 | `707:13010` | 360×807 |
| Edit profile_09 → Report_09 | `707:13096` | 360×807 |
| Edit profile_10 → Report_10 | `707:13316` | 360×807 |

## 공통 컴포넌트 (인스턴스로 재사용됨)

| 이름 | nodeId | 크기 | 비고 |
|------|--------|------|------|
| Navigation Bar_home | `348:19580` | 360×68 | 홈 탭 활성 |
| Navigation Bar_ai | `473:15426` | 360×68 | AI 탭 활성 |
| Navigation Bar_home (alt) | `473:15457` | 360×68 | 변형 |
| Navigation Bar_Mutual | `473:15488` | 360×68 | 상호인증 탭 활성 |
| Navigation Bar_family tree | `473:15549` | 360×68 | 가계도 탭 활성 |
| 연락하기_Button | `602:45717`, `602:44115` 등 | 76×76 | Quick Action |
| QR코드_Button | `602:45718`, `602:44100` | 76×76 | |
| 프로필 수정_Button | `602:45720`, `602:44125` | 76×76 | |
| 문제신고_Button | `602:45719`, `602:46847` | 76×76 | |
| 상호인증_Button | `562:27520`, `473:29220` | 228×48 / 328×160 | 두 가지 변형 |
| Chon ID_Tutorial | `542:26952` | 328×144 | Home 카드 |
| 상호인증_안내창 | `473:27996` | 328×64 | 배너 |
| Android Status Bar | `473:28001` 등 | 360×36 | 시스템 |
| Android Navigation Bar | `473:28003` 등 | 360×44 | 시스템 |

## 재사용 안내

특정 화면을 다시 보거나 코드로 변환하고 싶을 때:

```
fileKey: X44QW3oVr3BWkyW08m9zow
nodeId: <위 표에서 복사>
```

Figma MCP 도구로 호출:
- `get_screenshot(fileKey, nodeId)` — PNG URL (단명) 반환
- `use_figma + figma.getNodeByIdAsync(nodeId)` — 레이어 트리 / 색상 / 텍스트 / 좌표 (메타데이터)
- `get_design_context(fileKey, nodeId)` — Figma 데스크톱에서 해당 레이어 선택 후 호출하면 reference code 반환

## 코드로 옮긴 결과

| 산출물 | 경로 |
|--------|------|
| 디자인 토큰 (Color · TextStyle · Shape) | [`mobile/lib/core/theme/chon_design_tokens.dart`](../../mobile/lib/core/theme/chon_design_tokens.dart) |
| Bottom Nav (5 변형) | [`mobile/lib/presentations/widgets/chon_bottom_navigation_bar.dart`](../../mobile/lib/presentations/widgets/chon_bottom_navigation_bar.dart) |
| Quick Action 버튼 (76×76) + 4-up 그리드 | [`mobile/lib/presentations/widgets/chon_quick_action_button.dart`](../../mobile/lib/presentations/widgets/chon_quick_action_button.dart) |
| 사용 가이드 | [`mobile/lib/presentations/widgets/README.md`](../../mobile/lib/presentations/widgets/README.md) |
| Figma → Flutter 자동 변환 워크플로 | [`docs/figma/codegen_workflow.md`](./codegen_workflow.md) |

## 다음 단계 후보

- 각 섹션을 Flutter 위젯으로 번역 — [`codegen_workflow.md`](./codegen_workflow.md) 절차에 따라 nodeId 단위로 변환
- 컬러를 [Figma Variables](https://help.figma.com/hc/en-us/articles/15339657135383)로 등록 (현재 raw hex). 등록되면 `get_variable_defs`가 토큰 이름까지 반환해줌
- "Edit profile_NN" 잘못 라벨링된 Section 11 프레임을 "Report_NN"으로 리네이밍 (피그마 정리)
- 기존 `AppColors`를 `ChonColors` 기준으로 통합 (벤더 placeholder 정리, PR 단위로 분리 권장)
