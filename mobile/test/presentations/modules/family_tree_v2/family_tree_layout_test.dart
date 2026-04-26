import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/family_tree_layout.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/family_tree_node.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('layoutForest', () {
    test('empty roots → empty layout', () {
      final layout = layoutForest(const []);
      expect(layout.placed, isEmpty);
      expect(layout.canvas, Size.zero);
    });

    test('single root → exactly one placed node at origin', () {
      final roots = FamilyTreeNode.buildForest(const [
        RelationUserModel(id: 1, cardName: 'A'),
      ]);
      final layout = layoutForest(roots, nodeSize: const Size(96, 96));
      expect(layout.placed.length, 1);
      expect(layout.placed.first.offset, Offset.zero);
      expect(layout.canvas.width, 96);
      expect(layout.canvas.height, 96);
    });

    test('parent with two children — children laid horizontally', () {
      final roots = FamilyTreeNode.buildForest(const [
        RelationUserModel(id: 1, cardName: 'P'),
        RelationUserModel(id: 2, parentId: 1, cardName: 'C1'),
        RelationUserModel(id: 3, parentId: 1, cardName: 'C2'),
      ]);
      final layout = layoutForest(roots,
          nodeSize: const Size(96, 96), hGap: 16, vGap: 32);

      expect(layout.placed.length, 3);

      final p = layout.findById(1)!;
      final c1 = layout.findById(2)!;
      final c2 = layout.findById(3)!;

      // Parent above children (smaller y).
      expect(p.offset.dy, 0);
      expect(c1.offset.dy, 96 + 32);
      expect(c2.offset.dy, 96 + 32);

      // Children laid out horizontally with hGap between them.
      expect(c2.offset.dx - c1.offset.dx, 96 + 16);

      // Parent centered horizontally over the children's footprint.
      final childrenLeft = c1.offset.dx;
      final childrenRight = c2.offset.dx + 96;
      final childrenCenter = (childrenLeft + childrenRight) / 2;
      expect(p.offset.dx + 48, closeTo(childrenCenter, 0.001));
    });

    test('two disjoint roots are placed side by side, no overlap', () {
      final roots = FamilyTreeNode.buildForest(const [
        RelationUserModel(id: 1, cardName: 'A'),
        RelationUserModel(id: 2, cardName: 'B'),
      ]);
      final layout = layoutForest(roots,
          nodeSize: const Size(80, 80), hGap: 16);

      expect(layout.placed.length, 2);
      final a = layout.findById(1)!;
      final b = layout.findById(2)!;
      expect(b.offset.dx - a.offset.dx, 80 + 16);
    });

    test('canvas height matches deepest leaf', () {
      final roots = FamilyTreeNode.buildForest(const [
        RelationUserModel(id: 1, cardName: 'P'),
        RelationUserModel(id: 2, parentId: 1, cardName: 'C'),
        RelationUserModel(id: 3, parentId: 2, cardName: 'GC'),
      ]);
      final layout = layoutForest(roots,
          nodeSize: const Size(80, 80), vGap: 20);

      // 3 levels: 80 + 20 + 80 + 20 + 80 = 280
      expect(layout.canvas.height, 80 + 20 + 80 + 20 + 80);
    });
  });

  group('PlacedNode geometry helpers', () {
    test('center / topCenter / bottomCenter', () {
      final p = PlacedNode(
        node: FamilyTreeNode(
          id: 1,
          raw: const RelationUserModel(id: 1),
        ),
        offset: const Offset(10, 20),
        size: const Size(96, 96),
      );
      expect(p.center, const Offset(58, 68));
      expect(p.topCenter, const Offset(58, 20));
      expect(p.bottomCenter, const Offset(58, 116));
    });
  });
}
