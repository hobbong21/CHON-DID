import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/domain/repositories/verify_repo.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_receive/cubit/mutual_auth_receive_cubit.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_receive/mutual_auth_receive_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRelationRepo extends Mock implements RelationRepo {}

class _MockVerifyRepo extends Mock implements VerifyRepo {}

Widget _harness(Widget child) => MaterialApp(home: child);

MutualAuthReceiveCubit _makeCubit() => MutualAuthReceiveCubit(
      relationRepo: _MockRelationRepo(),
      verifyRepo: _MockVerifyRepo(),
    );

void main() {
  group('MutualAuthReceivePage', () {
    testWidgets('empty state shows 받은 요청이 없습니다.', (tester) async {
      final cubit = _makeCubit();
      await tester.pumpWidget(_harness(MutualAuthReceivePage(cubit: cubit)));
      await tester.pump();
      expect(find.text('받은 요청이 없습니다.'), findsOneWidget);
    });

    testWidgets('renders request rows from state', (tester) async {
      final cubit = _makeCubit();
      cubit.emit(MutualAuthReceiveState(
        requests: const [
          RelationUserModel(
            id: 1,
            certOwnerName: 'Alice',
            certOwnerPhone: '01000000001',
          ),
          RelationUserModel(
            id: 2,
            certOwnerName: 'Bob',
            certOwnerPhone: '01000000002',
          ),
        ],
      ));
      await tester.pumpWidget(_harness(MutualAuthReceivePage(cubit: cubit)));
      await tester.pump();
      expect(find.text('Alice'), findsOneWidget);
      expect(find.text('Bob'), findsOneWidget);
    });

    testWidgets('opens detail sheet when a row is tapped', (tester) async {
      final cubit = _makeCubit();
      cubit.emit(MutualAuthReceiveState(
        requests: const [
          RelationUserModel(
            id: 1,
            certOwnerName: 'Alice',
            certOwnerPhone: '01000000001',
          ),
        ],
        selected: const RelationUserModel(
          id: 1,
          certOwnerName: 'Alice',
          certOwnerPhone: '01000000001',
        ),
      ));
      await tester.pumpWidget(_harness(MutualAuthReceivePage(cubit: cubit)));
      await tester.pump();

      expect(find.text('요청 상세'), findsOneWidget);
      expect(find.text('승인'), findsOneWidget);
      expect(find.text('거절'), findsOneWidget);
    });

    testWidgets('approved stage shows 승인 완료', (tester) async {
      final cubit = _makeCubit();
      cubit.emit(MutualAuthReceiveState(
        selected: const RelationUserModel(id: 1, certOwnerName: 'Alice'),
        stage: MutualAuthReceiveStage.approved,
      ));
      await tester.pumpWidget(_harness(MutualAuthReceivePage(cubit: cubit)));
      await tester.pump();
      expect(find.text('승인 완료'), findsOneWidget);
    });
  });
}
