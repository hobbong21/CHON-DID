import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/cubit/family_tree_cubit.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/family_tree_node.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/family_tree_v2_page.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/widgets/family_tree_node_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRelationRepo extends Mock implements RelationRepo {}

Widget _harness(Widget child) => MaterialApp(home: child);

FamilyTreeCubit _makeCubit() =>
    FamilyTreeCubit(relationRepo: _MockRelationRepo());

void main() {
  group('FamilyTreeV2Page', () {
    testWidgets('shows loading spinner when cubit is in loading state',
        (tester) async {
      final cubit = _makeCubit();
      cubit.emit(FamilyTreeState(isLoading: true));
      await tester.pumpWidget(_harness(FamilyTreeV2Page(cubit: cubit)));
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows empty message when no roots are present',
        (tester) async {
      final cubit = _makeCubit();
      cubit.emit(FamilyTreeState(isLoading: false));
      await tester.pumpWidget(_harness(FamilyTreeV2Page(cubit: cubit)));
      await tester.pump();
      expect(find.text('가족 정보가 없습니다.'), findsOneWidget);
    });

    testWidgets('renders node cards from forest', (tester) async {
      final roots = FamilyTreeNode.buildForest(const [
        RelationUserModel(id: 1, cardName: 'Alice'),
        RelationUserModel(id: 2, parentId: 1, cardName: 'Bob'),
      ]);
      final cubit = _makeCubit();
      cubit.emit(FamilyTreeState(roots: roots));

      await tester.pumpWidget(_harness(FamilyTreeV2Page(cubit: cubit)));
      await tester.pump();

      expect(find.byType(FamilyTreeNodeCard), findsNWidgets(2));
      expect(find.text('Alice'), findsOneWidget);
      expect(find.text('Bob'), findsOneWidget);
    });

    testWidgets('selected node opens detail sheet', (tester) async {
      final roots = FamilyTreeNode.buildForest(const [
        RelationUserModel(id: 1, cardName: 'Alice', certRelatedPhone: '010'),
      ]);
      final cubit = _makeCubit();
      cubit.emit(FamilyTreeState(roots: roots, selectedId: 1));

      await tester.pumpWidget(_harness(FamilyTreeV2Page(cubit: cubit)));
      await tester.pump();

      expect(find.byKey(const Key('familyTree.detail')), findsOneWidget);
    });
  });
}
