import 'package:base_flutter/data/models/report/report_model.dart';
import 'package:base_flutter/domain/repositories/report_repo.dart';
import 'package:base_flutter/presentations/modules/report_v2/cubit/report_v2_cubit.dart';
import 'package:base_flutter/presentations/modules/report_v2/report_v2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockReportRepo extends Mock implements ReportRepo {}

Widget _harness(Widget child) => MaterialApp(home: child);

ReportV2Cubit _makeCubit() =>
    ReportV2Cubit(reportRepo: _MockReportRepo());

void main() {
  group('ReportV2Page', () {
    testWidgets('list stage with no reports shows empty hint and CTA',
        (tester) async {
      final cubit = _makeCubit();
      await tester.pumpWidget(_harness(ReportV2Page(cubit: cubit)));
      await tester.pump();
      expect(find.text('이전 신고가 없습니다.'), findsOneWidget);
      expect(find.byKey(const Key('report.new')), findsOneWidget);
    });

    testWidgets('list stage renders past reports', (tester) async {
      final cubit = _makeCubit();
      cubit.emit(ReportV2State(reports: const [
        ReportModel(id: 1, title: 'Issue 1'),
        ReportModel(id: 2, title: 'Issue 2'),
      ]));
      await tester.pumpWidget(_harness(ReportV2Page(cubit: cubit)));
      await tester.pump();
      expect(find.text('Issue 1'), findsOneWidget);
      expect(find.text('Issue 2'), findsOneWidget);
    });

    testWidgets('compose stage shows submit button', (tester) async {
      final cubit = _makeCubit();
      cubit.emit(ReportV2State(stage: ReportV2Stage.compose));
      await tester.pumpWidget(_harness(ReportV2Page(cubit: cubit)));
      await tester.pump();
      expect(find.byKey(const Key('report.title')), findsOneWidget);
      expect(find.byKey(const Key('report.content')), findsOneWidget);
      expect(find.byKey(const Key('report.submit')), findsOneWidget);
    });

    testWidgets('submitted stage shows success copy', (tester) async {
      final cubit = _makeCubit();
      cubit.emit(ReportV2State(stage: ReportV2Stage.submitted));
      await tester.pumpWidget(_harness(ReportV2Page(cubit: cubit)));
      await tester.pump();
      expect(find.text('신고가 접수되었어요.'), findsOneWidget);
    });

    testWidgets('failed stage shows retry button', (tester) async {
      final cubit = _makeCubit();
      cubit.emit(ReportV2State(
        stage: ReportV2Stage.failed,
        errorMessage: 'Network down',
      ));
      await tester.pumpWidget(_harness(ReportV2Page(cubit: cubit)));
      await tester.pump();
      expect(find.text('전송에 실패했어요.'), findsOneWidget);
      expect(find.text('Network down'), findsOneWidget);
      expect(find.text('다시 시도'), findsOneWidget);
    });
  });
}
