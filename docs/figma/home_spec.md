# CHON 1.1 — Home 화면 디자인 명세

> Figma 파일: [CHON 1.1](https://www.figma.com/design/X44QW3oVr3BWkyW08m9zow/CHON-1.1)
> 페이지: `260316 Lastest version (Do NOT touch !)` (node `151:14267`)
> 화면: `Home` (node `473:27963`) · 360×800

## 화면 구조 (위에서 아래)

| 영역 | y / 높이 | 박스 | 비고 |
|------|----------|------|------|
| Android Status Bar | 0 / 36 | 360×36 | 시스템 바. 9:30 텍스트, Wi-Fi/배터리 아이콘 |
| App Header (`Frame 177617`) | 36 / 56 | 360×56, padding 0/16 | CHON 로고(좌, 97×24) + 알림 벨(우, 42×42) |
| Banner (`Frame 177618`) | 92 / 80 | 360×80, padding 8/16 | "상호인증으로 CHON ID를 만들어보세요." 안내 카드 |
| Main Cards (`Home_B01`) | 172 / 336 | 360×336, padding 8/16/16/16, vertical gap 8 | Tutorial 카드 + 상호 인증 카드 |
| Quick Actions (`Frame 177677`) | 508 / 292 | 360×292, padding 20/16/24/16, white bg | "입력 정보" 라벨 + 4개 액션 버튼 |
| Bottom Nav (`Navigation Bar_home`) | 688 / 68 | 360×68, padding 8/20/12/20, white bg | 홈·CHON·신분증(FAB)·상호인증·가계도 |
| Android Nav Bar | 756 / 44 | 360×44, white bg | 시스템 뒤로/홈/멀티태스크 |

## 카드 상세

### Tutorial 카드 (`Chon ID_Tutorial` instance)

배경 이미지(image 11) 위에 텍스트 오버레이.

- 박스: 16, 8, 328×144 / radius 20 / 흰 표면(이미지로 가려짐)
- 타이틀: `나를 확인 받는\nCHON DID 튜토리얼` — **Pretendard Bold 22px**, line 105%, **#ffffff**
- CTA: 70×26 둥근 사각형(radius 50), **2px** 흰 테두리, 안에 `arrow-up-1` 8×38 아이콘
- inner padding: 10/20/10/20, gap 20

### 상호인증 카드 (`상호인증_Button` instance)

좌측 텍스트 + 우측 일러스트(image 12, image 13)

- 박스: 16, 160, 328×160 / radius 20 / 흰 배경
- 타이틀: `상호 인증` — **Pretendard Bold 22px**, line 100%, **#1e1e1e**
- 서브: `가족, 인척과\n서로를 확인받기` — **Pretendard Medium 14px**, line 90%, **#5a5a5a**

### 안내 배너 (`상호인증_안내창` instance)

- 박스: 16, 8(밴드 안 기준), 328×64 / radius 20 / 흰 배경
- padding 20/16, gap 8
- 좌: shield-check 아이콘 24×24
- 본문: `상호인증으로 CHON ID를 만들어보세요.` — 16px (폰트 변수 처리)

### Quick Actions (4-up 그리드)

좌→우 순서: 연락하기(가계도) → 프로필 수정 → QR 코드 → 고객센터(문제신고)

| 버튼 | 라벨 | 위치(x,y) |
|------|------|-----------|
| 연락하기_Button | `연락하기\n(가계도)` | 0, 0 |
| 프로필 수정_Button | `프로필 수정` | 168, 0 |
| QR코드_Button | `QR 코드` | 84, 0 |
| 문제신고_Button | `고객센터` | 252, 0 |

각 버튼 공통 스펙:
- 76×76 / radius 0 / 흰 배경
- vertical layout, gap 8, padding 12/8/12/8
- 아이콘 28×28 (상단 중앙)
- 라벨: **Pretendard Bold 14px**, line 80~86%, **#1e1e1e**
- 그룹 라벨 `입력 정보` (상단): Pretendard Medium 14px, **#5a5a5a**, line 105%

### Bottom Navigation (`Navigation Bar_home`)

5칸: 홈(선택) · CHON · **신분증(FAB)** · 상호인증 · 가계도
- 컨테이너: 360×68 / 흰 배경 / horizontal gap 48 / padding 8/20/12/20
- 일반 메뉴 아이템: 50×52 / vertical gap 8 / padding 4/8 / 아이콘 24×24 + 라벨 12px
- 라벨 색: 선택 `#5a5a5a`, 비선택 `#8e8e93`, 폰트 Pretendard (Std Variable) Medium 12px line 100%
- **FAB(신분증)**: 68×68, **radius 50**, fill **#ffa000**, 위쪽으로 -12px 튀어나옴, 라벨/아이콘 흰색

## 디자인 토큰 (이 화면에서 추출)

### Color

| Role | Hex | 사용처 |
|------|-----|--------|
| `bg/page` | `#f5f5f5` | 페이지 배경 |
| `bg/surface` | `#ffffff` | 카드, 바텀 내비, 액션 그리드 |
| `bg/overlay` | `#000000 @60%` | 카메라/모달 오버레이 (ID Gen 화면에서 사용) |
| `brand/primary` | `#ffa000` | FAB(신분증) 배경 |
| `brand/accent` | `#ff9500` | 로고 보조색 (Ellipse 2) |
| `brand/dark` | `#0c0c16` | 로고 베이스 |
| `text/primary` | `#1e1e1e` | 본문 타이틀 / 액션 라벨 |
| `text/secondary` | `#5a5a5a` | 보조 텍스트 / 선택된 nav |
| `text/tertiary` | `#8e8e93` | 비선택 nav 라벨 |
| `icon/disabled` | `#bfbfbf`, `#b4b2b3` | 비활성 아이콘 stroke |
| `icon/strong` | `#404040` | 알림 아이콘 stroke |
| `text/inverse` | `#ffffff` | Tutorial 카드 텍스트, FAB 텍스트 |

### Typography (Pretendard 베이스)

| Role | Style |
|------|-------|
| Display / Card title | Pretendard **Bold 22px** / line 100~105% |
| Action label | Pretendard **Bold 14px** / line 80~86% |
| Section label | Pretendard Medium 14px / line 105% |
| Body | Pretendard Medium 14px / line 90~130% |
| Nav label | Pretendard (Std Variable) Medium 12px / line 100% |
| System (status bar) | Roboto Regular 14px / line 20px |

> letterSpacing은 본문 14~16px에서 `-1.5%`가 자주 사용됨.

### Radius / Shape

- 카드: **20**
- FAB / pill 버튼 / 둥근 테두리 CTA: **50** (pill)
- 시스템 카메라 indicator: **100** (원)
- 액션 버튼 사각형: 0

### Spacing

- 페이지 좌우 패딩: **16**
- 섹션 간격(VERTICAL gap): 8 / 10
- 카드 내부 padding: 20/16, 12/8 (액션 버튼)

## 캡처

- 페이지 단위 캡처(151:14267, 503×1024): `figma/page_151_14267.png` *(MCP URL 만료 — 재캡처 필요시 fileKey+nodeId로 다시 호출)*
- Home 캡처(473:27963, 360×800): `figma/home_473_27963.png` *(동일)*

> Figma MCP의 screenshot URL은 단명입니다. 영구 보존이 필요하면 Figma 데스크톱에서 직접 export(PNG/SVG) 하시거나, 매번 MCP로 재발급해서 받아야 합니다.

## 다음 화면 후보

같은 페이지에 있는 주요 섹션 (라벨 프레임 기준 — 이 위치에 큰 텍스트로 섹션 제목이 적혀있음):

| 섹션 | 비고 | 시작 프레임 후보 |
|------|------|------------------|
| 0. Splash Screen | 앱 시작 | `754:12524` (Splash Screen) |
| 1. Tutorial | 4-step | `320:18658` (Tutorial_01) |
| 2. Home / Start | 홈 + 시작 플로우 | `473:27963` (Home, **현재 문서**), `473:28371`/`473:28909`/`473:28838` (Start_01~03) |
| 3. ID Generation | 신분증 발급 | `182:23526` (ID_01), `300:4231` (ID Gen_02), `300:5360`(ID Gen_03)... 30+ frames |
| 4. MutualAuth_Online | 상호인증 - 온라인 송신 | `312:19987` ~ `473:29905` |
| 5. MutualAuth_Online_Receive | 상호인증 - 온라인 수신 | `347:23942` 등 |
| 6. MutualAuth_Offline_Request | 오프라인 (QR) | `376:24285`, `376:24436` |
| 7. Family Tree | 가계도 | `517:20730` (Family Tree_01) 외 select 시리즈 |
| 8. InputProcessing_Contact | 연락하기 처리 | `376:21766`, `376:22695` |
| 9. AI Chat | 챗봇 | `602:45133` (AI Chat_01), `376:26362` 외 02_01~10 |
| 10. Edit profile | 프로필 수정 | `602:44564` (Edit profile_01) 외 02~10 |
| 11. Report a problem | 문제 신고 | `602:45977` (Home → 신고 시작) |

각 섹션의 모든 화면을 같은 명세 문서로 만들 수 있습니다 — 어느 섹션부터 진행할지 알려주세요.
