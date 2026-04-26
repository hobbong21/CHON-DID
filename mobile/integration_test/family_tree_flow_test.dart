import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/cubit/family_tree_cubit.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/family_tree_v2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRelationRepo extends Mock implements RelationRepo {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('family tree — load → render forest → select node → close',
      (tester) async {
    final repo = _MockRelationRepo();
    when(() => repo.getRelationList(
          certOwnerId: any(named: 'certOwnerId'),
          phoneNumber: any(named: 'phoneNumber'),
        )).thenAnswer((_) async => const [
          RelationUserModel(id: 1, cardName: 'Root'),
          RelationUserModel(id: 2, parentId: 1, cardName: 'Child'),
        ]);

    final cubit = FamilyTreeCubit(relationRepo: repo);
    await cubit.load(certOwnerId: 7);

    await tester.pumpWidget(MaterialApp(
      home: FamilyTreeV2Page(cubit: cubit, title: 'Family tree'),
    ));
    await tester.pumpAndSettle();

    // Forest renders both nodes.
    expect(find.text('Root'), findsOneWidget);
    expect(find.text('Child'), findsOneWidget);

    // Select root → detail sheet visible.
    cubit.selectNode(1);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('familyTree.detail')), findsOneWidget);
    expect(cubit.state.selectedId, 1);

    // Tap selectNode(1) again toggles the selection off.
    cubit.selectNode(1);
    await tester.pumpAndSettle();
    expect(cubit.state.selectedId, isNull);
  });
}
