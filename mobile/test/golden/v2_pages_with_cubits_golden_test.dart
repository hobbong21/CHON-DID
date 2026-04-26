/// Golden tests for v2 pages that depend on a Cubit + Repo.
///
/// Each test stubs the repository with mocktail, builds the cubit, optionally
/// seeds a state via `cubit.emit(...)`, and snapshots the rendered tree. Tests
/// use the [goldenHarness] from [golden_test_harness.dart].
///
/// Why a separate file from the simple goldens?
/// - These tests need mocktail mocks per-page; keeping them isolated from the
///   simple goldens means a flaky cubit doesn't block the cheap goldens from
///   running.
/// - Reading them lets a future contributor see exactly what state each page
///   needs to render its "happy path" first frame.
///
/// To regenerate:
/// ```
/// flutter test test/golden/v2_pages_with_cubits_golden_test.dart --update-goldens
/// ```
import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/domain/repositories/ocr_repo.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/domain/repositories/report_repo.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/cubit/family_tree_cubit.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/family_tree_v2_page.dart';
import 'package:base_flutter/presentations/modules/id_generation_v2/cubit/id_generation_cubit.dart';
import 'package:base_flutter/presentations/modules/id_generation_v2/id_generation_v2_page.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_request/cubit/mutual_auth_request_cubit.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_request/mutual_auth_request_page.dart';
import 'package:base_flutter/presentations/modules/report_v2/cubit/report_v2_cubit.dart';
import 'package:base_flutter/presentations/modules/report_v2/report_v2_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'golden_test_harness.dart';

class _MockRelationRepo extends Mock implements RelationRepo {}

class _MockSelfIdRepo extends Mock implements SelfIdRepo {}

class _MockOcrRepo extends Mock implements OcrRepo {}

class _MockReportRepo extends Mock implements ReportRepo {}

void main() {
  setUpAll(() async {
    silenceFlutterErrors();
    await loadPretendardFont();
  });

  group('v2 cubit-backed pages — golden', () {
    testWidgets('MutualAuthRequestPage — initial search step', (tester) async {
      final cubit =
          MutualAuthRequestCubit(relationRepo: _MockRelationRepo());
      await matchGolden(
        tester,
        goldenHarness(MutualAuthRequestPage(cubit: cubit)),
        name: 'mutual_auth_request_search_step',
      );
      await cubit.close();
    }, tags: kGoldenTag);

    testWidgets('MutualAuthRequestPage — confirm step with target',
        (tester) async {
      final cubit =
          MutualAuthRequestCubit(relationRepo: _MockRelationRepo());
      cubit.emit(MutualAuthRequestState(
        stage: MutualAuthRequestStage.confirm,
        target: const RelationUserModel(
          id: 1,
          certRelatedName: '홍길동',
          certRelatedPhone: '01012345678',
        ),
      ));
      await matchGolden(
        tester,
        goldenHarness(MutualAuthRequestPage(cubit: cubit)),
        name: 'mutual_auth_request_confirm_step',
      );
      await cubit.close();
    }, tags: kGoldenTag);

    testWidgets('ReportV2Page — list (empty state) step', (tester) async {
      final cubit = ReportV2Cubit(reportRepo: _MockReportRepo());
      // Default state is `list` with empty reports — produces the
      // empty-state CTA "신고 내용 작성".
      await matchGolden(
        tester,
        goldenHarness(ReportV2Page(cubit: cubit)),
        name: 'report_v2_list_empty',
      );
      await cubit.close();
    }, tags: kGoldenTag);

    testWidgets('IdGenerationV2Page — start stage', (tester) async {
      final cubit = IdGenerationCubit(
        selfIdRepo: _MockSelfIdRepo(),
        ocrRepo: _MockOcrRepo(),
      );
      await matchGolden(
        tester,
        goldenHarness(IdGenerationV2Page(cubit: cubit)),
        name: 'id_generation_v2_start',
      );
      await cubit.close();
    }, tags: kGoldenTag);

    testWidgets('FamilyTreeV2Page — empty state', (tester) async {
      final cubit = FamilyTreeCubit(relationRepo: _MockRelationRepo());
      // Default state: not loading, empty roots → renders the empty-state CTA.
      await matchGolden(
        tester,
        goldenHarness(FamilyTreeV2Page(cubit: cubit)),
        name: 'family_tree_v2_empty',
      );
      await cubit.close();
    }, tags: kGoldenTag);
  });
}
