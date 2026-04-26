import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/family_tree_node.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FamilyTreeNode.buildForest', () {
    test('empty input → empty forest', () {
      expect(FamilyTreeNode.buildForest(const []), isEmpty);
    });

    test('single root with no children', () {
      final forest = FamilyTreeNode.buildForest(const [
        RelationUserModel(id: 1, cardName: 'A'),
      ]);
      expect(forest.length, 1);
      expect(forest.first.id, 1);
      expect(forest.first.children, isEmpty);
      expect(forest.first.isRoot, isTrue);
    });

    test('parent → children link by parentId', () {
      final forest = FamilyTreeNode.buildForest(const [
        RelationUserModel(id: 1, cardName: 'Root'),
        RelationUserModel(id: 2, parentId: 1, cardName: 'Child A'),
        RelationUserModel(id: 3, parentId: 1, cardName: 'Child B'),
        RelationUserModel(id: 4, parentId: 2, cardName: 'Grandchild'),
      ]);

      expect(forest.length, 1);
      final root = forest.first;
      expect(root.children.length, 2);
      final names = root.children.map((c) => c.name).toSet();
      expect(names, {'Child A', 'Child B'});

      final childA = root.children.firstWhere((c) => c.id == 2);
      expect(childA.children.length, 1);
      expect(childA.children.first.name, 'Grandchild');
    });

    test('orphan whose parent is missing becomes its own root', () {
      final forest = FamilyTreeNode.buildForest(const [
        // parentId 99 doesn't exist in the input.
        RelationUserModel(id: 1, parentId: 99, cardName: 'Orphan'),
        RelationUserModel(id: 2, cardName: 'OtherRoot'),
      ]);
      expect(forest.length, 2);
      expect(forest.map((n) => n.id).toSet(), {1, 2});
    });

    test('spouseId attaches as horizontal pointer, not child', () {
      final forest = FamilyTreeNode.buildForest(const [
        RelationUserModel(id: 1, cardName: 'Husband', spouseId: 2),
        RelationUserModel(id: 2, cardName: 'Wife', spouseId: 1),
      ]);
      expect(forest.length, 2);
      final husband = forest.firstWhere((n) => n.id == 1);
      final wife = forest.firstWhere((n) => n.id == 2);
      expect(husband.spouse?.id, 2);
      expect(wife.spouse?.id, 1);
      expect(husband.children, isEmpty);
      expect(wife.children, isEmpty);
    });

    test('skips entries with null id', () {
      final forest = FamilyTreeNode.buildForest(const [
        RelationUserModel(id: null, cardName: 'Ignored'),
        RelationUserModel(id: 1, cardName: 'Kept'),
      ]);
      expect(forest.length, 1);
      expect(forest.first.id, 1);
    });
  });
}
