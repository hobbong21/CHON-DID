# Family Tree (Section 7) — 다음 세션 인계 노트

이번 세션에서 토큰 잔량을 고려해 Family Tree는 데이터 모델 스캐폴드까지만 작업하고 본 구현은 다음 세션으로 인계합니다. 이 문서는 다음 세션에서 빠르게 이어가기 위한 컨텍스트입니다.

## 대상 화면 (Section 7, 8개)

[`docs/figma/index.md`](./index.md) Section 7 표 발췌:

| 이름 | nodeId | 비고 |
|------|--------|------|
| Family Tree_01 | `517:20730` | 메인 트리 뷰 |
| Family Tree_select_01 | `517:20765` | 노드 선택 — 1단계 |
| Family Tree_select_02 | `517:20800` | 선택 — 2단계 |
| Family Tree_select_03_02 | `602:29899` | 선택 03_02 |
| Family Tree_select_03_03 | `602:29934` | 선택 03_03 |
| Family Tree_select_03_04 | `602:29969` | 선택 03_04 |
| Family Tree_select_04_01 | `602:31029` | 선택 04_01 |
| Family Tree_select_04_02 | `602:29866` | 선택 04_02 |

이름의 패턴(`select_NN_MM`)으로 보아 트리에서 노드를 선택했을 때 확장/하이라이트되는 다양한 상태일 가능성이 큽니다. 첫 단계는 어느 화면을 디폴트로 보고, 어떤 상태들이 select_*에 해당하는지 Figma에서 직접 확인 필요.

## 이미 들어와있는 의존성

- `mobile/lib/data/models/family/relation_model.dart` — `RelationUserModel`, `StatusRelationE`, `RelationType` 등 이미 정의됨. 트리 노드의 데이터 source로 사용 가능
- `mobile/lib/domain/repositories/relation_repo.dart` — 가족 관계 API:
  - `getRelationList(certOwnerId, phoneNumber)` — 관계 목록
  - `createRelation(...)` — 관계 생성
- 기존 `mobile/lib/presentations/modules/family_tree/family_tree_page.dart` — 벤더가 만든 초기 구현 있음. 분석 후 v2로 갈아끼울지 보강할지 결정

## 권장 접근 (다음 세션에서)

### 1. Figma 데스크톱에서 Family Tree_01 (`517:20730`) 선택 → `get_design_context` 실행

```
"node 517:20730 (Family Tree_01)을 Flutter 코드로 변환해줘"
```

이걸로 reference code를 받은 다음, 토큰/공통 위젯으로 후처리.

### 2. 데이터 구조 (이번 세션에 미리 만들어둔 스캐폴드)

`mobile/lib/presentations/modules/family_tree_v2/family_tree_node.dart`에 트리 노드 추상이 들어있습니다:

```dart
class FamilyTreeNode {
  final int id;
  final String? name;
  final RelationUserModel? raw;
  final List<FamilyTreeNode> children;
  // ...
}
```

원시 `RelationUserModel` 리스트 → 트리 변환 함수도 같이 들어있어요. 화면 단위 작업할 때 이걸 입력으로 쓰면 됩니다.

### 3. 렌더링 — CustomPainter or Stack + Positioned

가족 트리는 보통 두 방식 중 하나로 그립니다:

**A) `CustomPainter` 한 장에 노드 + 연결선 모두 그리기** — 성능은 가장 좋고 핀치 줌/팬도 자연스럽지만, 노드 안에 텍스트/이미지 같은 widget을 넣기 까다로움. `TextPainter`로 텍스트만 그리는 식.

**B) `Stack` + `Positioned`로 노드 widget 배치 + `CustomPainter`는 연결선만** — 노드를 진짜 widget으로 두니까 탭/롱프레스/그림자 같은 평소 패턴이 그대로 됨. 성능은 노드 수가 많아지면 약간 떨어짐 (수백 개 이상이면 문제).

CHON 가계도가 대형(수백 노드)일 가능성 적으니 **B 추천**.

### 4. 줌/팬

`InteractiveViewer`로 감싸면 핀치 줌, 두 손가락 팬, 디바이스 회전 자동 대응됩니다. 코드 한 줄.

```dart
InteractiveViewer(
  minScale: 0.4,
  maxScale: 3.0,
  boundaryMargin: EdgeInsets.all(200),
  child: SizedBox(
    width: treeWidth,
    height: treeHeight,
    child: Stack(children: [...]),
  ),
)
```

### 5. 테스트

- **Cubit/노드 빌드 단위 테스트**: 평면 `RelationUserModel` 리스트 → 트리 구조로 변환되는지
- **위젯 테스트**: 트리 렌더링은 골든 테스트가 좋습니다. `matchesGoldenFile`로 트리 한 번 캡쳐해두면 회귀 잡기 쉬움
- **상호작용**: 노드 탭 → 선택 상태 (`select_01`...) 전환

## 참고 코드 패턴 (Mutual Auth Request에서 가져갈 것)

이번 세션에 만든 [`mutual_auth_request`](../../mobile/lib/presentations/modules/mutual_auth_request/) 모듈이 좋은 참고:

- Cubit + `Stage` enum으로 상태 머신
- 페이지 한 개에서 `BlocBuilder` switch로 stage별 view 분기
- 각 step을 작은 위젯 클래스로 분리
- 디자인 토큰(`ChonColors`, `ChonTextStyles`) + 공통 위젯 사용
- 테스트는 Cubit 단위 + 페이지 위젯 분리

Family Tree도 비슷하게 갈 수 있어요:
- `FamilyTreeStage`: idle / selecting (node id) / detailLoaded / addingRelation
- 한 페이지에서 stage에 따라 다른 sheet/오버레이 표시

## 빠른 시작 체크리스트 (다음 세션 첫 메시지)

```
1. Figma 데스크톱에서 CHON 1.1 파일 열기
2. node 517:20730 (Family Tree_01) 선택
3. 채팅에 "node 517:20730을 Flutter 코드로 변환해줘" 라고 말하기
4. 결과를 family_tree_v2_page.dart로 정리
5. 같이 docs/figma/family_tree_handoff.md 따라 진행
```
