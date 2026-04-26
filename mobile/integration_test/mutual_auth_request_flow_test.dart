import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_request/cubit/mutual_auth_request_cubit.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_request/mutual_auth_request_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRelationRepo extends Mock implements RelationRepo {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(GenderE.male);
  });

  testWidgets('mutual auth request — happy path: search → confirm → done',
      (tester) async {
    final repo = _MockRelationRepo();

    when(() => repo.getListRequester(phoneNumber: any(named: 'phoneNumber')))
        .thenAnswer((_) async => const [
              RelationUserModel(
                id: 1,
                certRelatedId: 99,
                certRelatedName: 'Bob',
                certRelatedPhone: '01000000000',
                certOwnerId: 7,
              ),
            ]);
    when(() => repo.createRelation(
          gender: any(named: 'gender'),
          parentId: any(named: 'parentId'),
          spouseId: any(named: 'spouseId'),
          certOwnerId: any(named: 'certOwnerId'),
          certRelatedId: any(named: 'certRelatedId'),
          certRelatedName: any(named: 'certRelatedName'),
          certRelatedPhone: any(named: 'certRelatedPhone'),
        )).thenAnswer((_) async => const RelationUserModel());

    final cubit = MutualAuthRequestCubit(relationRepo: repo);

    await tester.pumpWidget(MaterialApp(
      home: MutualAuthRequestPage(cubit: cubit),
    ));
    await tester.pumpAndSettle();

    // 1) search — type a phone number and tap Next.
    await tester.enterText(
      find.byKey(const Key('mutualAuth.phoneField')),
      '01000000000',
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('mutualAuth.search.next')));
    await tester.pumpAndSettle();

    // 2) confirm step shows the target name.
    expect(find.text('Bob'), findsOneWidget);
    expect(cubit.state.stage, MutualAuthRequestStage.confirm);

    // 3) Drive sendRequest directly (button label varies by locale).
    await cubit.sendRequest(gender: GenderE.male, certOwnerId: 7);
    await tester.pumpAndSettle();
    expect(cubit.state.stage, MutualAuthRequestStage.awaiting);

    // 4) Counterparty approves → responded.
    cubit.onCounterpartyResponded(approved: true);
    await tester.pumpAndSettle();
    expect(cubit.state.stage, MutualAuthRequestStage.responded);
    expect(cubit.state.wasApproved, isTrue);

    // 5) Dismiss → done.
    cubit.finish();
    await tester.pumpAndSettle();
    expect(cubit.state.stage, MutualAuthRequestStage.done);
  });
}
