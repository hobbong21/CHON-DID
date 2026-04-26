import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/domain/repositories/verify_repo.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_receive/cubit/mutual_auth_receive_cubit.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_receive/mutual_auth_receive_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRelationRepo extends Mock implements RelationRepo {}

class _MockVerifyRepo extends Mock implements VerifyRepo {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('mutual auth receive — load list → approve → list shrinks',
      (tester) async {
    final relRepo = _MockRelationRepo();
    final verRepo = _MockVerifyRepo();

    when(() => relRepo.getListRequester(phoneNumber: any(named: 'phoneNumber')))
        .thenAnswer((_) async => const [
          RelationUserModel(
            id: 1,
            certRelatedId: 99,
            certOwnerName: 'Alice',
            certOwnerPhone: '01000000001',
          ),
          RelationUserModel(
            id: 2,
            certRelatedId: 88,
            certOwnerName: 'Bob',
            certOwnerPhone: '01000000002',
          ),
        ]);
    when(() => verRepo.confirmVerify(
          verifyType: any(named: 'verifyType'),
          refVerifyId: any(named: 'refVerifyId'),
        )).thenAnswer((_) async {});

    final cubit = MutualAuthReceiveCubit(
      relationRepo: relRepo,
      verifyRepo: verRepo,
    );
    await cubit.load('01000000000');

    await tester.pumpWidget(MaterialApp(
      home: MutualAuthReceivePage(cubit: cubit),
    ));
    await tester.pumpAndSettle();

    // List shows both names.
    expect(find.text('Alice'), findsOneWidget);
    expect(find.text('Bob'), findsOneWidget);

    // Open detail for Alice and approve.
    cubit.selectRequest(const RelationUserModel(id: 1, certRelatedId: 99));
    await tester.pumpAndSettle();
    expect(cubit.state.selected?.id, 1);

    await cubit.approve();
    await tester.pumpAndSettle();
    expect(cubit.state.stage, MutualAuthReceiveStage.approved);
    expect(cubit.state.requests.length, 1);
    expect(cubit.state.requests.first.id, 2);
  });
}
