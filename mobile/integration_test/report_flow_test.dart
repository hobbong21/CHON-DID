import 'package:base_flutter/data/models/report/report_model.dart';
import 'package:base_flutter/data/models/self_id/create_card_model.dart';
import 'package:base_flutter/domain/repositories/report_repo.dart';
import 'package:base_flutter/presentations/modules/report_v2/cubit/report_v2_cubit.dart';
import 'package:base_flutter/presentations/modules/report_v2/report_v2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockReportRepo extends Mock implements ReportRepo {}

class _FakeCreateReportRequest extends Fake implements CreateReportRequest {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(_FakeCreateReportRequest());
  });

  testWidgets('report — list → compose → submit success', (tester) async {
    final repo = _MockReportRepo();
    when(() => repo.getListReport()).thenAnswer((_) async => const []);
    when(() => repo.createReport(report: any(named: 'report')))
        .thenAnswer((_) async => const CreateCertificateRes());

    final cubit = ReportV2Cubit(reportRepo: repo);
    await cubit.loadReports();

    await tester.pumpWidget(MaterialApp(
      home: ReportV2Page(cubit: cubit),
    ));
    await tester.pumpAndSettle();

    // Empty list + new report button visible.
    expect(find.byKey(const Key('report.new')), findsOneWidget);

    // Open compose form.
    cubit.openCompose();
    await tester.pumpAndSettle();
    expect(cubit.state.stage, ReportV2Stage.compose);

    // Fill in fields and submit.
    cubit.onTitleChanged('Bug found');
    cubit.onContentChanged('App crashed when tapping the FAB.');
    await cubit.submit();
    await tester.pumpAndSettle();

    expect(cubit.state.stage, ReportV2Stage.submitted);
    verify(() => repo.createReport(report: any(named: 'report'))).called(1);
  });
}
