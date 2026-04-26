import 'package:base_flutter/data/models/report/report_model.dart';
import 'package:base_flutter/data/models/self_id/create_card_model.dart';
import 'package:base_flutter/domain/repositories/report_repo.dart';
import 'package:base_flutter/presentations/modules/report_v2/cubit/report_v2_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockReportRepo extends Mock implements ReportRepo {}

class _FakeCreateReportRequest extends Fake implements CreateReportRequest {}

void main() {
  late _MockReportRepo repo;

  setUpAll(() {
    registerFallbackValue(_FakeCreateReportRequest());
  });

  setUp(() {
    repo = _MockReportRepo();
  });

  ReportV2Cubit make() => ReportV2Cubit(reportRepo: repo);

  group('loadReports', () {
    blocTest<ReportV2Cubit, ReportV2State>(
      'success populates the report list',
      build: () {
        when(() => repo.getListReport()).thenAnswer((_) async => const [
              ReportModel(id: 1, title: 'Issue 1'),
              ReportModel(id: 2, title: 'Issue 2'),
            ]);
        return make();
      },
      act: (c) => c.loadReports(),
      expect: () => [
        isA<ReportV2State>().having((s) => s.isLoading, 'isLoading', true),
        isA<ReportV2State>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.reports.length, 'reports.length', 2),
      ],
    );

    blocTest<ReportV2Cubit, ReportV2State>(
      'failure populates errorMessage',
      build: () {
        when(() => repo.getListReport()).thenThrow(Exception('boom'));
        return make();
      },
      act: (c) => c.loadReports(),
      expect: () => [
        isA<ReportV2State>().having((s) => s.isLoading, 'isLoading', true),
        isA<ReportV2State>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.errorMessage, 'errorMessage', contains('boom')),
      ],
    );
  });

  group('compose flow', () {
    blocTest<ReportV2Cubit, ReportV2State>(
      'openCompose moves to compose stage and resets the form',
      build: () => make(),
      seed: () => ReportV2State(
        title: 'old title',
        content: 'old content',
        attachmentBase64: 'old',
      ),
      act: (c) => c.openCompose(),
      expect: () => [
        isA<ReportV2State>()
            .having((s) => s.stage, 'stage', ReportV2Stage.compose)
            .having((s) => s.title, 'title', '')
            .having((s) => s.content, 'content', '')
            .having((s) => s.attachmentBase64, 'attachmentBase64', isNull),
      ],
    );

    blocTest<ReportV2Cubit, ReportV2State>(
      'on*Changed updates the field',
      build: () => make(),
      act: (c) {
        c.onTitleChanged('hi');
        c.onContentChanged('there');
        c.onFullNameChanged('홍길동');
        c.onEmailChanged('a@b.c');
      },
      expect: () => [
        isA<ReportV2State>().having((s) => s.title, 'title', 'hi'),
        isA<ReportV2State>().having((s) => s.content, 'content', 'there'),
        isA<ReportV2State>().having((s) => s.fullName, 'fullName', '홍길동'),
        isA<ReportV2State>().having((s) => s.email, 'email', 'a@b.c'),
      ],
    );

    blocTest<ReportV2Cubit, ReportV2State>(
      'attachFile / clearAttachment toggles attachmentBase64',
      build: () => make(),
      act: (c) {
        c.attachFile('base64data');
        c.clearAttachment();
      },
      expect: () => [
        isA<ReportV2State>()
            .having((s) => s.attachmentBase64, 'set', 'base64data'),
        isA<ReportV2State>()
            .having((s) => s.attachmentBase64, 'cleared', isNull),
      ],
    );
  });

  group('submit', () {
    blocTest<ReportV2Cubit, ReportV2State>(
      'with empty title or content emits an error and stays in compose',
      build: () => make(),
      seed: () => ReportV2State(stage: ReportV2Stage.compose),
      act: (c) => c.submit(),
      expect: () => [
        isA<ReportV2State>()
            .having((s) => s.errorMessage, 'errorMessage',
                contains('제목과 내용')),
      ],
    );

    blocTest<ReportV2Cubit, ReportV2State>(
      'success → submitting → submitted',
      build: () {
        when(() => repo.createReport(report: any(named: 'report')))
            .thenAnswer((_) async => const CreateCertificateRes());
        return make();
      },
      seed: () => ReportV2State(
        stage: ReportV2Stage.compose,
        title: 'T',
        content: 'C',
      ),
      act: (c) => c.submit(),
      expect: () => [
        isA<ReportV2State>().having(
            (s) => s.stage, 'stage', ReportV2Stage.submitting),
        isA<ReportV2State>().having(
            (s) => s.stage, 'stage', ReportV2Stage.submitted),
      ],
    );

    blocTest<ReportV2Cubit, ReportV2State>(
      'failure → submitting → failed with errorMessage',
      build: () {
        when(() => repo.createReport(report: any(named: 'report')))
            .thenThrow(Exception('network'));
        return make();
      },
      seed: () => ReportV2State(
        stage: ReportV2Stage.compose,
        title: 'T',
        content: 'C',
      ),
      act: (c) => c.submit(),
      expect: () => [
        isA<ReportV2State>().having(
            (s) => s.stage, 'stage', ReportV2Stage.submitting),
        isA<ReportV2State>()
            .having((s) => s.stage, 'stage', ReportV2Stage.failed)
            .having((s) => s.errorMessage, 'errorMessage', contains('network')),
      ],
    );
  });

  group('navigation helpers', () {
    blocTest<ReportV2Cubit, ReportV2State>(
      'backToList resets to list and clears the form',
      build: () => make(),
      seed: () => ReportV2State(
        stage: ReportV2Stage.submitted,
        title: 't',
        content: 'c',
      ),
      act: (c) => c.backToList(),
      expect: () => [
        isA<ReportV2State>()
            .having((s) => s.stage, 'stage', ReportV2Stage.list)
            .having((s) => s.title, 'title', '')
            .having((s) => s.content, 'content', ''),
      ],
    );

    blocTest<ReportV2Cubit, ReportV2State>(
      'retryFromFailed goes back to compose and clears the error',
      build: () => make(),
      seed: () => ReportV2State(
        stage: ReportV2Stage.failed,
        errorMessage: 'old',
      ),
      act: (c) => c.retryFromFailed(),
      expect: () => [
        isA<ReportV2State>()
            .having((s) => s.stage, 'stage', ReportV2Stage.compose)
            .having((s) => s.errorMessage, 'errorMessage', ''),
      ],
    );
  });
}
