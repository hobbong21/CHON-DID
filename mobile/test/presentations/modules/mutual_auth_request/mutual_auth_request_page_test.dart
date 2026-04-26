import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_request/cubit/mutual_auth_request_cubit.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_request/mutual_auth_request_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRelationRepo extends Mock implements RelationRepo {}

class _StubMutualAuthRequestCubit extends MutualAuthRequestCubit {
  _StubMutualAuthRequestCubit(super.repo);

  factory _StubMutualAuthRequestCubit.make() {
    return _StubMutualAuthRequestCubit(_MockRelationRepo());
  }

  void seed(MutualAuthRequestState s) => emit(s);
}

extension on _StubMutualAuthRequestCubit {
  static _StubMutualAuthRequestCubit ctor() {
    final repo = _MockRelationRepo();
    return _StubMutualAuthRequestCubit(repo);
  }
}

Widget _harness(Widget child) => MaterialApp(home: child);

void main() {
  group('MutualAuthRequestPage', () {
    testWidgets('search step renders phone field and Next button',
        (tester) async {
      final cubit =
          MutualAuthRequestCubit(relationRepo: _MockRelationRepo());
      await tester
          .pumpWidget(_harness(MutualAuthRequestPage(cubit: cubit)));
      await tester.pump();

      expect(find.text('인증할 가족의\n전화번호를 입력해주세요.'), findsOneWidget);
      expect(find.byKey(const Key('mutualAuth.phoneField')), findsOneWidget);
      expect(find.byKey(const Key('mutualAuth.search.next')), findsOneWidget);
    });

    testWidgets('confirm step shows target name and 요청 보내기 button',
        (tester) async {
      final cubit =
          MutualAuthRequestCubit(relationRepo: _MockRelationRepo());
      cubit.emit(MutualAuthRequestState(
        stage: MutualAuthRequestStage.confirm,
        target: const RelationUserModel(
          id: 1,
          certRelatedName: 'Alice',
          certRelatedPhone: '01000000000',
        ),
      ));

      await tester
          .pumpWidget(_harness(MutualAuthRequestPage(cubit: cubit)));
      await tester.pump();

      expect(find.text('이 분 맞으신가요?'), findsOneWidget);
      expect(find.text('Alice'), findsOneWidget);
      expect(find.text('요청 보내기'), findsOneWidget);
    });

    testWidgets('done step renders the celebration card', (tester) async {
      final cubit =
          MutualAuthRequestCubit(relationRepo: _MockRelationRepo());
      cubit.emit(MutualAuthRequestState(
        stage: MutualAuthRequestStage.done,
        wasApproved: true,
      ));

      await tester
          .pumpWidget(_harness(MutualAuthRequestPage(cubit: cubit)));
      await tester.pump();

      expect(find.text('인증이 완료되었어요.'), findsOneWidget);
    });
  });
}
